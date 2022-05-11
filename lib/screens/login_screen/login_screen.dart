import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:keep_moving/screens/otp_screen/otp_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _loginController = Get.put(LoginController());
  late TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
            child: VxBox(
                    child: [
          VxBox(child: Lottie.asset('assets/animations/car.json'))
              .gray100
              .make()
              .wFull(context)
              .expand(),
          VxBox(
                  child: [
            'LOGIN'.text.blue900.xl.semiBold.make(),
            'Login with your phone number'.text.gray500.make().py(10),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                errorStyle: const TextStyle(letterSpacing: 1),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                hintText: 'Enter phone number',
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]!, width: 1.0),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]!, width: 1.0),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]!, width: 1.0),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]!, width: 1.0),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
              ),
              
            ),
            MaterialButton(
              onPressed: () async {
                await _loginController.login(_phoneController.text);
                context.nextPage(OTPreceived(phone: _phoneController.text));
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
              child: 'SEND OTP'.text.white.make(),
            ).py(10),
            Text.rich(TextSpan(children: <TextSpan>[
              'By clicking you are agree to our'.textSpan.make(),
              ' Terms & Conditions '.textSpan.blue900.make(),
              'and'.textSpan.make(),
              ' Privacy Policy'.textSpan.blue900.make()
            ]))
          ].column(crossAlignment: CrossAxisAlignment.start).px20().py(10))
              .make()
        ].column())
                .make()
                .whFull(context)));
  }
}
