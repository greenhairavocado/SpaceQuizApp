import 'package:get_storage/get_storage.dart';

class UserLocalService {
  static String userUid = "userUid";
  static final box = GetStorage();

  static setUserId(String userId) {
    box.write(userUid, userId);
  }

  static getUserId() {
    return box.read(userUid);
  }

  static clearLocal() {
    box.erase();
  }
}
