import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../SQLite/database_helper.dart';
import '../../component/app_elevated_button.dart';
import '../../component/app_text_form_field.dart';
import '../../models/users.dart';
import '../../resources/app_color.dart';
import 'login_page.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
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

  Future<void> signUp() async {
    try {
      var res = await db.createUser(Users(
          email: email.text,
          password: password.text,
          imgStr: 'assets/images/nguoidung.png'));
      print(res);
      if (res > 0) {
        if (!mounted) return;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      } else {
        showSnackbar('Failed to create user.');
      }
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
    final pattern = r'^[\w-]+(\.[\w-]+)*@gmail.com$';
    final regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

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

  void validateEmail(String value) {
    setState(() {
      isEmailValid = isValidGmail(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                  .copyWith(top: 48.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/dog_walking.jpg',
                    height: 200.0,
                  ),
                  Text(
                    'Register',
                    style: GoogleFonts.fredoka(
                      fontSize: 40.0,
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'By registering, you are agreeing to our ',
                      style: GoogleFonts.fredoka(
                        fontSize: 21.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: 'Terms and Privacy Policy',
                          style: GoogleFonts.fredoka(
                            fontSize: 21.0,
                            fontWeight: FontWeight.w400,
                            color: AppColor.buttonColor,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20.0),
                  AppTextFormField(
                    controller: email,
                    isPassword: false,
                    hintText: 'Email Address',
                    onChanged: validateEmail,
                    icon: const Icon(Icons.email_outlined),
                    textInputAction: TextInputAction.next,
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
                    controller: password,
                    onChanged: validatePassword,
                    icon: const Icon(Icons.lock_outline_rounded),
                    textInputAction: TextInputAction.next,
                  ),
                  if (!isPasswordValid)
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Password must be at least 8 digits long',
                        style: TextStyle(color: Colors.red, fontSize: 13.0),
                      ),
                    ),
                  const SizedBox(height: 20.0),
                  AppTextFormField(
                    isPassword: true,
                    controller: confirmPassword,
                    hintText: 'Confirm Password',
                    onChanged: validateConfirmPassword,
                    icon: const Icon(Icons.lock_outline_rounded),
                    textInputAction: TextInputAction.done,
                  ),
                  if (!isConfirmPasswordValid)
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Password and Confirm Password must match.',
                        style: TextStyle(color: Colors.red, fontSize: 13.0),
                      ),
                    ),
                  const SizedBox(height: 20.0),
                  AppElevatedButton(
                    height: 45.0,
                    width: 318.0,
                    text: 'Sign up',
                    textColor: Colors.black,
                    color: AppColor.buttonColor,
                    borderColor: AppColor.buttonColor,
                    onPressed: signUp,
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
