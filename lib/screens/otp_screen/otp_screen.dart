import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/instance_manager.dart';
import 'package:intl/intl.dart';
import 'package:keep_moving/controller/otp_controller.dart';
import 'package:keep_moving/screens/otp_screen/otp_verified.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class OTPreceived extends StatefulWidget {
  final String? phone;
  const OTPreceived({Key? key, @required this.phone}) : super(key: key);

  @override
  State<OTPreceived> createState() => _OTPreceivedState();
}

class _OTPreceivedState extends State<OTPreceived> {
  final OTPController _otpController = Get.put(OTPController());
  NumberFormat formatter = NumberFormat("00");

  TextEditingController otp1 = TextEditingController();
  TextEditingController otp2 = TextEditingController();
  TextEditingController otp3 = TextEditingController();
  TextEditingController otp4 = TextEditingController();
  TextEditingController otp5 = TextEditingController();
  TextEditingController otp6 = TextEditingController();

  final formGlobalKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    otp1 = TextEditingController();
    otp2 = TextEditingController();
    otp3 = TextEditingController();
    otp4 = TextEditingController();
    otp5 = TextEditingController();
    otp6 = TextEditingController();
  }

  @override
  void dispose() {
    otp1.dispose();
    otp2.dispose();
    otp3.dispose();
    otp4.dispose();
    otp5.dispose();
    otp6.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: VStack([
          ZStack([
            VxBox(
                    child: [
              Lottie.asset('assets/animations/otp_notification.json',
                  width: 250),
              'Verification Code'.text.xl2.semiBold.make().py20(),
              'We have sent the verification code to the your mobile number'
                  .text
                  .lg
                  .align(TextAlign.center)
                  .gray400
                  .make(),
              VxBox(
                      child: [
                otpField(otp1, true, 1),
                otpField(otp2, false, 2),
                otpField(otp3, false, 3),
                otpField(otp4, false, 4),
                otpField(otp5, false, 5),
                otpField(otp6, false, 6),
              ].row(alignment: MainAxisAlignment.spaceEvenly))
                  .make()
                  .py20()
                  .wFull(context),
              MaterialButton(
                onPressed: () async {
                  await _otpController.otpVerify(
                      widget.phone!,
                      otp1.text +
                          otp2.text +
                          otp3.text +
                          otp4.text +
                          otp5.text +
                          otp6.text);
                  context.nextPage(const OTPverified());
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
                child: 'Verify'.text.white.make(),
              ),
            ].column(alignment: MainAxisAlignment.center))
                .make()
                .px20()
                .whFull(context),
          ])
        ]).scrollVertical(),
      ),
    );
  }

  Widget otpField(TextEditingController otp, bool autoFocus, int counter) {
    return VxBox(
      child: TextField(
        controller: otp,
        autofocus: autoFocus,
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.center,
        cursorColor: Colors.black87,
        maxLength: 1,
        style: const TextStyle(color: Colors.black87),
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          counterText: '',
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[400]!, width: 1.0),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[400]!, width: 1.0),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[400]!, width: 1.0),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[400]!, width: 1.0),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            if (counter != 6) {
              FocusScope.of(context).nextFocus();
            }
          }
        },
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    ).square(50).gray100.withRounded(value: 15).make();
  }
}
