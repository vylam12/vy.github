import 'package:cuoiki/pages/sign/login_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../component/app_elevated_button.dart';
import '../../resources/app_color.dart';

class SuccessChangePage extends StatelessWidget {
  const SuccessChangePage({super.key});

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
                        Icons.check,
                        size: 40.0,
                        color: AppColor.textButton,
                      )),
                  const Gap(25.0),
                  Text(
                    "Woo hoo!",
                    style: GoogleFonts.fredoka(
                      fontSize: 25.0,
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColor.textButton,
                      ),
                    ),
                  ),
                  const Gap(18.0),
                  Text(
                    "Your password has been reset successfully!",
                    style: GoogleFonts.fredoka(
                      fontSize: 15.0,
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColor.textButton,
                      ),
                    ),
                  ),
                  Text(
                    "Now login with your new password",
                    style: GoogleFonts.fredoka(
                      fontSize: 15.0,
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColor.textButton,
                      ),
                    ),
                  ),
                  const Gap(35.0),
                  AppElevatedButton(
                    height: 50.0,
                    width: 318.0,
                    text: 'Login',
                    textColor: AppColor.green,
                    color: AppColor.textButton,
                    borderColor: AppColor.textButton,
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                        (route) => false,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
