import 'package:get/state_manager.dart';
import 'package:keep_moving/remote_service/authentication.dart';

class SignupController extends GetxController {

  Future<bool> signup(String email, String name, String phone, String designation,
      String gst, String uuid) async {
    var result =
        await RemoteServices.signup(email, name, phone, designation, gst, uuid);
    if (result["status"]) {
      return true;
    }
    return false;
  }
}
