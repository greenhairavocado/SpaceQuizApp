import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../user_local_services/user_local_service.dart';

class ProfileRepository extends GetxController {
  static getProfileDataStream() {
    CollectionReference collRef = FirebaseFirestore.instance.collection("user");
    var streamProfile = collRef.doc(UserLocalService.getUserId()).snapshots();
    return streamProfile;
  }
}
