import 'dart:collection';

import 'package:get/state_manager.dart';
import 'package:keep_moving/models/user.dart';
import 'package:keep_moving/remote_service/authentication.dart';

class ShowProfileController extends GetxController {
  var user = User().obs;

  Future<bool> showProfile() async {
    var result = await RemoteServices.showProfile();
    if (result["status"]) {
      user.value = User.fromJson(result["data"]);
      return true;
    }
    return false;
  }
}
