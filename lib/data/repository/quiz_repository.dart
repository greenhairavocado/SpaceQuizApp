import 'package:cloud_firestore/cloud_firestore.dart';

import '../../user_local_services/user_local_service.dart';

class QuizRepository {
  static setResult(Map<String, dynamic> data) async {
    CollectionReference collRef = FirebaseFirestore.instance.collection("user");
    await collRef
        .doc(UserLocalService.getUserId())
        .update({
          "history": FieldValue.arrayUnion([data])
        })
        .then((value) => print("Quiz data add in history successfully"))
        .catchError((e) => print(e));
  }
}
