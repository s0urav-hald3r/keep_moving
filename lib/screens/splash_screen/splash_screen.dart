import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(milliseconds: 4700),
        () => Navigator.of(context).pushNamedAndRemoveUntil(
            '/mainmenu', (Route<dynamic> route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: VxBox(
      child:
          Center(child: Lottie.asset('assets/animations/car.json', width: 250)),
    ).make().whFull(context));
  }
}
