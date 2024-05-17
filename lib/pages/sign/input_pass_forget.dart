import 'package:cuoiki/pages/sign/succes_change_pass.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../component/app_elevated_button.dart';
import '../../resources/app_color.dart';

class InputPassForget extends StatefulWidget {
  const InputPassForget({super.key});

  @override
  State<InputPassForget> createState() => _InputPassForgetState();
}

class _InputPassForgetState extends State<InputPassForget> {
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  bool isPasswordValid = true;
  bool isConfirmPasswordValid = true;
  void validatePassword(String value) {
    setState(() {
      isPasswordValid = value.length >= 8;
    });
  }

  void validateConfirmPassword(String value) {
    setState(() {
      isConfirmPasswordValid = value == password.text;
    });
  }

  Future<void> submit() async {
    try {
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SuccessChangePage()),
      );
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.green,
      appBar: AppBar(
        backgroundColor: AppColor.green,
        iconTheme: const IconThemeData(color: Colors.white, size: 35),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 15.0),
          child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
              ),
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
                        Icons.lock_outline_rounded,
                        size: 40.0,
                        color: AppColor.textButton,
                      )),
                  const Gap(20.0),
                  Text(
                    "Reset your password",
                    style: GoogleFonts.fredoka(
                      fontSize: 25.0,
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColor.textButton,
                      ),
                    ),
                  ),
                  const Gap(20.0),
                  Container(
                    width: 382.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: AppColor.buttonColor),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      controller: password,
                      onChanged: validatePassword,
                      obscureText: false,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.email_outlined,
                          color: AppColor.green.withOpacity(0.7),
                        ),
                        hintText: 'New Password',
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
                  const Gap(5),
                  if (!isPasswordValid)
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Password must be at least 8 digits long',
                        style: TextStyle(
                            color: AppColor.textButton, fontSize: 13.0),
                      ),
                    ),
                  const Gap(15),
                  Container(
                    width: 382.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: AppColor.buttonColor),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      controller: confirmPassword,
                      onChanged: validateConfirmPassword,
                      obscureText: false,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.email_outlined,
                          color: AppColor.green.withOpacity(0.7),
                        ),
                        hintText: 'Confirm Password',
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
                  const Gap(5),
                  if (!isConfirmPasswordValid)
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Password and Confirm Password must match.',
                        style: TextStyle(
                            color: AppColor.textButton, fontSize: 13.0),
                      ),
                    ),
                  const Gap(30.0),
                  AppElevatedButton(
                    height: 50.0,
                    width: 318.0,
                    text: 'Reset password',
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
