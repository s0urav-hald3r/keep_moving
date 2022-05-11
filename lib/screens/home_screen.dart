import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keep_moving/controller/showProfile_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ShowProfileController _showProfileController =
      Get.put(ShowProfileController());

  @override
  void initState() {
    super.initState();
    _showProfileController.showProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => VxBox(
        child: [
          'Name : ${_showProfileController.user.value.name}'
              .text
              .hexColor('#14102B')
              .bold
              .size(18)
              .make()
              .py12(),
          'Email Address : ${_showProfileController.user.value.email}'
              .text
              .hexColor('#14102B')
              .bold
              .size(18)
              .make()
              .py12(),
          'Phone Number : ${_showProfileController.user.value.phone}'
              .text
              .hexColor('#14102B')
              .bold
              .size(18)
              .make()
              .py12(),
          'Designation : ${_showProfileController.user.value.designation}'
              .text
              .hexColor('#14102B')
              .bold
              .size(18)
              .make()
              .py12(),
          'GST Number : ${_showProfileController.user.value.gst}'
              .text
              .hexColor('#14102B')
              .bold
              .size(18)
              .make()
              .py12(),
        ]
            .column(crossAlignment: CrossAxisAlignment.start)
            .scrollVertical()
            .centered(),
      ).make().whFull(context),
    ));
  }
}
