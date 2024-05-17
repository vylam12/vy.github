import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../SQLite/database_helper.dart';
import '../../component/app_elevated_button.dart';
import '../../component/app_text_form_field.dart';
import '../../models/users.dart';
import '../../resources/app_color.dart';
import '../loading_page.dart';
import 'create_account_page.dart';
import 'forget_pass_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();

  bool isChecked = false;
  bool isLoginTrue = false;
  bool isPasswordValid = true;
  final db = DatabaseHelper();
  bool isEmailValid = true;

  //Login Method
  login() async {
    Users? usrDetails = await db.getUser(email.text);
    var res = await db
        .authenticate(Users(email: email.text, password: password.text));
    if (res == true) {
      int usrId = usrDetails?.usrId ?? 0;
      if (!mounted) return;
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoadingPage(userId: usrId)),
        (route) => false,
      );
    } else {
      //Otherwise show the error message
      setState(() {
        isLoginTrue = true;
      });
    }
  }

  void validatePassword(String value) {
    setState(() {
      isPasswordValid = value.length >= 8;
    });
  }

  void validateEmail(String value) {
    setState(() {
      isEmailValid = isValidGmail(value);
    });
  }

  bool isValidGmail(String email) {
    const pattern = r'^[\w-]+(\.[\w-]+)*@gmail.com$';
    final regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            Opacity(opacity: 1, child: Image.asset('assets/images/nen.jpg')),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23.0)
                    .copyWith(top: 60.0),
                child: ListView(
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: 200.0,
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    AppTextFormField(
                      isPassword: false,
                      icon: const Icon(Icons.email_outlined),
                      hintText: 'Email Address',
                      controller: email,
                      textInputAction: TextInputAction.next,
                      onChanged: validateEmail,
                    ),
                    if (!isEmailValid)
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Enter a valid email address',
                          style: TextStyle(color: Colors.red, fontSize: 13.0),
                        ),
                      ),
                    const SizedBox(height: 20.0),
                    AppTextFormField(
                      isPassword: true,
                      hintText: 'Password',
                      icon: const Icon(Icons.lock_outline_rounded),
                      controller: password,
                      textInputAction: TextInputAction.done,
                      onChanged: validatePassword,
                    ),
                    if (!isPasswordValid)
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Password must be at least 8 digits long',
                          style: TextStyle(color: Colors.red, fontSize: 13.0),
                        ),
                      ),
                    const SizedBox(height: 10.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ForgetPassPage()));
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 150.0, bottom: 40.0),
                        child: Text(
                          'Forget Password?',
                          style: GoogleFonts.fredoka(
                              fontSize: 20.0,
                              textStyle: const TextStyle(
                                color: AppColor.buttonColor,
                                fontWeight: FontWeight.w400,
                              )),
                        ),
                      ),
                    ),
                    AppElevatedButton(
                      height: 45.0,
                      width: 318.0,
                      text: 'LOGIN',
                      textColor: Colors.black,
                      color: AppColor.buttonColor,
                      borderColor: AppColor.buttonColor,
                      onPressed: () {
                        login();
                      },
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Text(
                            'Don\'t have account?',
                            style: GoogleFonts.fredoka(
                              color: AppColor.buttonColor,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        const SizedBox(width: 11.0),
                        GestureDetector(
                          child: Text(
                            'Sign up',
                            style: GoogleFonts.fredoka(
                              color: AppColor.buttonColor,
                              fontSize: 18.0,
                              textStyle:
                                  const TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const CreateAccountPage()));
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
