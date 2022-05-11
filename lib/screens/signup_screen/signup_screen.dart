import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:keep_moving/controller/signup_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final SignupController _signupController = Get.put(SignupController());
  late TextEditingController _emailController = TextEditingController();
  late TextEditingController _nameController = TextEditingController();
  late TextEditingController _phoneController = TextEditingController();
  late TextEditingController _gstController = TextEditingController();

  final _options = ["Personal", "Business", "House Shifting"];

  String? option = "Personal";

  bool isSuccess = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _gstController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _gstController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: 'Sign Up'.text.base.blue900.make(),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black87,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: VxBox(
                child: [
          VxBox(
                  child: [
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                errorStyle: const TextStyle(letterSpacing: 1),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                hintText: 'Enter email address',
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
            ).pOnly(bottom: 10),
            TextField(
              controller: _nameController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                errorStyle: const TextStyle(letterSpacing: 1),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                hintText: 'Enter name',
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
            ).pOnly(bottom: 10),
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
            ).pOnly(bottom: 10),
            FormField<String>(
              builder: (FormFieldState<String> state) {
                return InputDecorator(
                  decoration: InputDecoration(
                    errorStyle: const TextStyle(letterSpacing: 1),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10),
                    errorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey[400]!, width: 1.0),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey[400]!, width: 1.0),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey[400]!, width: 1.0),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey[400]!, width: 1.0),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: option,
                      isExpanded: true,
                      isDense: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          option = newValue;
                        });
                      },
                      items: _options
                          .map<DropdownMenuItem<String>>((String valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            ).pOnly(bottom: 10),
            TextField(
              controller: _gstController,
              keyboardType: TextInputType.streetAddress,
              decoration: InputDecoration(
                errorStyle: const TextStyle(letterSpacing: 1),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                hintText: 'Enter GST (Optional)',
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
            ).pOnly(bottom: 10),
            Text.rich(TextSpan(children: <TextSpan>[
              'By clicking you are agree to our'.textSpan.make(),
              ' Terms & Conditions '.textSpan.blue900.make(),
              'and'.textSpan.make(),
              ' Privacy Policy'.textSpan.blue900.make()
            ]))
          ].column(crossAlignment: CrossAxisAlignment.start))
              .make(),
          MaterialButton(
            onPressed: () async {
              isSuccess = await _signupController.signup(
                  _emailController.text,
                  _nameController.text,
                  _phoneController.text,
                  option!,
                  _gstController.text,
                  'uuid');
              if (isSuccess) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/mainmenu', (Route<dynamic> route) => false);
              }
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
        ].column(alignment: MainAxisAlignment.spaceBetween).p20())
            .make()
            .whFull(context));
  }
}
