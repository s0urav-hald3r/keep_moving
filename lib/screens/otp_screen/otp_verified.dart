import 'package:flutter/material.dart';
import 'package:keep_moving/screens/home_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class OTPverified extends StatefulWidget {
  const OTPverified({Key? key}) : super(key: key);

  @override
  State<OTPverified> createState() => _OTPverifiedState();
}

class _OTPverifiedState extends State<OTPverified> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (() async => false),
      child: Scaffold(
        body: VxBox(
          child: [
            Lottie.asset('assets/animations/otp_verified.json', width: 250),
            'OTP Verified'.text.hexColor('#14102B').bold.size(18).make().py12(),
            'Your mobile is now verified & ready to use! Start by logging in to your account.'
                .text
                .center
                .gray500
                .make()
                .px24()
                .pOnly(bottom: 30),
            MaterialButton(
              onPressed: () {
                // Navigator.of(context).pushNamedAndRemoveUntil(
                //     '/home', (Route<dynamic> route) => false);
                context.nextPage(const HomeScreen());
              },
              shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 1,
                    color: Color.fromARGB(255, 1, 36, 89),
                  ),
                  borderRadius: BorderRadius.circular(5)),
              elevation: 0,
              color: const Color.fromARGB(255, 1, 36, 89),
              minWidth: double.infinity,
              height: 40,
              child: 'Done'.text.white.make(),
            ).px20(),
          ].column().scrollVertical().centered(),
        ).make().whFull(context),
      ),
    );
  }
}
