import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../data/repository/profile_repository.dart';

class ProfileController extends GetxController {
  Stream<DocumentSnapshot> getProfile() {
    var streamChat = ProfileRepository.getProfileDataStream();
    return streamChat;
  }
}
