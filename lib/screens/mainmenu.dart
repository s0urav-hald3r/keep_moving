import 'package:flutter/material.dart';
import 'package:keep_moving/screens/login_screen/login_screen.dart';
import 'package:keep_moving/screens/signup_screen/signup_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: VxBox(
                    child: [
      VxBox(
              child: [
        Lottie.asset('assets/animations/car.json', width: 250),
        'Welcome'.text.blue900.xl.semiBold.make().py(10),
        'Already have an account click login, otherwise click signup'
            .text
            .sm
            .gray500
            .make()
      ].column())
          .make()
          .py(10),
      VxBox(
              child: [
        MaterialButton(
          onPressed: () {
            context.nextPage(const LoginScreen());
          },
          shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 1,
                color: Color.fromARGB(255, 1, 36, 89),
              ),
              borderRadius: BorderRadius.circular(5)),
          elevation: 0,
          minWidth: double.infinity,
          height: 40,
          child: 'LOGIN'.text.blue900.make(),
        ),
        MaterialButton(
          onPressed: () {
            context.nextPage(const SignupScreen());
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
          child: 'SIGN UP'.text.white.make(),
        )
      ].column())
          .make()
    ].column(alignment: MainAxisAlignment.spaceBetween).px20().py(10))
                .make()
                .whFull(context)));
  }
}
