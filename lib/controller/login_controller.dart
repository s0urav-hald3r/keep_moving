import 'package:get/state_manager.dart';
import 'package:keep_moving/remote_service/authentication.dart';

class LoginController extends GetxController {
  Future<bool> login(String phone) async {
    var result = await RemoteServices.login(phone);
    if (result["status"]) {
      return true;
    }
    return false;
  }
}
