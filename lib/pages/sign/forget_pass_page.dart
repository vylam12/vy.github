import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../SQLite/database_helper.dart';
import '../../component/app_elevated_button.dart';
import '../../resources/app_color.dart';
import 'input_pass_forget.dart';

class ForgetPassPage extends StatefulWidget {
  const ForgetPassPage({super.key});

  @override
  State<ForgetPassPage> createState() => _ForgetPassPageState();
}

class _ForgetPassPageState extends State<ForgetPassPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  String emailError = '';
  String passwordError = '';
  String confirmPasswordError = '';
  bool isPasswordValid = true;
  bool isConfirmPasswordValid = true;
  bool isEmailValid = true;
  final db = DatabaseHelper();

  Future<void> submit() async {
    try {
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const InputPassForget()),
      );
    } catch (error) {
      showSnackbar('Error: $error');
    }
  }

  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  bool isValidGmail(String email) {
    const pattern = r'^[\w-]+(\.[\w-]+)*@gmail.com$';
    final regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  void validateEmail(String value) {
    setState(() {
      isEmailValid = isValidGmail(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.green,
      appBar: AppBar(
        backgroundColor: AppColor.green,
        iconTheme: const IconThemeData(color: Colors.white),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 15.0),
          child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 35.0),
              onPressed: () => Navigator.pop(context)),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0)
                  .copyWith(top: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: 70.0,
                      height: 70.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        border:
                            Border.all(color: AppColor.textButton, width: 2.0),
                        color: AppColor.green.withOpacity(0.9),
                      ),
                      child: const Icon(
                        Icons.question_mark,
                        size: 40.0,
                        color: AppColor.textButton,
                      )),
                  const Gap(20.0),
                  Text(
                    "It's okay! Reset your password",
                    style: GoogleFonts.fredoka(
                      fontSize: 25.0,
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColor.textButton,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    width: 382.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: AppColor.buttonColor),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      controller: email,
                      onChanged: validateEmail,
                      obscureText: false,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.email_outlined,
                          color: AppColor.green.withOpacity(0.7),
                        ),
                        hintText: 'Email Address',
                        hintStyle: GoogleFonts.fredoka(
                          fontSize: 18.0,
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColor.green.withOpacity(0.7),
                          ),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const Gap(9),
                  if (!isEmailValid)
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Enter a valid email address',
                        style: TextStyle(
                            color: AppColor.textButton, fontSize: 13.0),
                      ),
                    ),
                  const Gap(30.0),
                  AppElevatedButton(
                    height: 50.0,
                    width: 318.0,
                    text: 'Continue',
                    textColor: AppColor.green,
                    color: AppColor.textButton,
                    borderColor: AppColor.textButton,
                    onPressed: submit,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
