import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  static Future<Map<String, dynamic>> signUpWithEmailAndPassword(
      String email, String password) async {
    Map<String, dynamic> response = {};
    try {
      UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user?.uid != null) {
        response = {
          "status": true,
          "user_id": credential.user?.uid,
          "message": "sign up successfully"
        };
      } else {
        response = {"status": false, "message": "user id getting null"};
      }
      return response;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        response = {
          "status": false,
          "message": "The password provided is too weak."
        };
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        response = {
          "status": false,
          "message": "The account already exists for that email."
        };
      } else {
        response = {
          "status": false,
          "message": " Please connect your internet connection"
        };
      }
      return response;
    } catch (e) {
      print(e);
      response = {"status": false, "message": e};
      return response;
    }
  }

  static Future<Map<String, dynamic>> logInWithEmailAndPassword(
      String email, String password) async {
    Map<String, dynamic> response = {};
    try {
      UserCredential credential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user?.uid != null) {
        response = {
          "status": true,
          "user_id": credential.user?.uid,
          "message": "sign in successfully"
        };
      } else {
        response = {"status": false, "message": "user id getting null"};
      }
      return response;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        response = {
          "status": false,
          "message": "No user found for that email."
        };
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        response = {
          "status": false,
          "message": "Wrong password provided for that user.."
        };
      } else {
        response = {
          "status": false,
          "message": " Please connect your internet connection"
        };
      }
      return response;
    } catch (e) {
      print(e);
      response = {"status": false, "message": e};
      return response;
    }
  }

 static Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<bool> setUserLogInData(Map<String, dynamic> userData) async {
    bool isEntered = false;
    CollectionReference collRef = FirebaseFirestore.instance.collection("user");
    await collRef.doc(userData["userid"]).set(userData).then((value) {
      print("~~~~~~~~  user register successfully value~~~~~~~~~~");
      isEntered = true;
    }).catchError((error) {
      print("~~~~~~~~  user not register successfully ~~~~~~~~~~");
      isEntered = false;
    });
    return isEntered;
  }

  static Future<Map<String, dynamic>?> getUserData(String userID) async {
    Map<String, dynamic>? documentData;
    CollectionReference collRef = FirebaseFirestore.instance.collection("user");
    await collRef.where('userid', isEqualTo: userID).get().then((event) {
      if (event.docs.isNotEmpty) {
        documentData = event.docs.single.data() as Map<String, dynamic>?;
      }
    }).catchError((e) => null);
    return documentData;
  }
}
