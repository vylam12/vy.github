import 'dart:async';
import 'package:carepet/pages/onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';
import '../../resources/app_color.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 3000), () {
      Route route =
          MaterialPageRoute(builder: (context) => const OnboardingPage());
      Navigator.pushAndRemoveUntil(
          context, route, (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundHomeColor,
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          height: 200.0,
        ),
      ),
    );
  }
}
