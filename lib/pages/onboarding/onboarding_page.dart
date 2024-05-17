import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../resources/app_color.dart';
import '../sign/login_page.dart';
import 'onboarding_items.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundHomeColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 180.0),
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 200.0,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Text(
                    'Hey! Welcome',
                    style: GoogleFonts.fredoka(
                        fontSize: 20,
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                  SizedBox(
                    width: 282.0,
                    height: 63.0,
                    child: Text(
                      'While you sit and stay - We’ll go out and play',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.fredoka(
                          fontSize: 15.0,
                          textStyle: const TextStyle(color: AppColor.grey)),
                    ),
                  ),
                  const SizedBox(height: 35.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const OnboardingItemsPage()));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 26.0),
                      alignment: Alignment.center,
                      width: 244.0,
                      height: 57.0,
                      decoration: BoxDecoration(
                        color: AppColor.buttonColor,
                        border:
                            Border.all(color: AppColor.buttonColor, width: 1.6),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(32.0),
                        ),
                      ),
                      child: Text(
                        'GET STARTED',
                        style: GoogleFonts.fredoka(
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 20.0,
            right: 20.0,
            bottom: 120.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Text(
                    'Already have an account?',
                    style: GoogleFonts.fredoka(
                      fontSize: 18.0,
                      textStyle: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(width: 11.0),
                GestureDetector(
                  child: Text(
                    'Login',
                    style: GoogleFonts.fredoka(
                      color: AppColor.buttonColor,
                      fontSize: 18.0,
                      textStyle: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginPage()));
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
