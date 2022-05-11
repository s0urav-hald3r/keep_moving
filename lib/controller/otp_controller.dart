import 'package:get/state_manager.dart';
import 'package:keep_moving/remote_service/authentication.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OTPController extends GetxController {
  late SharedPreferences _prefs;

  @override
  void onInit() async {
    super.onInit();
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> otpVerify(String phone, String otp) async {
    var result = await RemoteServices.otpVerify(phone, otp);
    await _prefs.setString('token', result["token"]);
    if (result["status"]) {
      return true;
    }
    return false;
  }
}
