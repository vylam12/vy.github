import 'package:cuoiki/pages/sign/login_page.dart';
import 'package:cuoiki/pages/onboarding/onboard_details.dart';
import 'package:cuoiki/models/onboard_details.dart';
import 'package:cuoiki/resources/app_color.dart';
import 'package:flutter/material.dart';

class OnboardingItemsPage extends StatefulWidget {
  const OnboardingItemsPage({Key? key}) : super(key: key);

  @override
  State<OnboardingItemsPage> createState() => _OnboardingItemsPageState();
}

class _OnboardingItemsPageState extends State<OnboardingItemsPage> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void goToNextPage() {
    if (_currentPage < onboards.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 100),
        curve: Curves.bounceIn,
      );
      setState(() {
        _currentPage++;
      });
    } else {
      Route route = MaterialPageRoute(builder: (context) => const LoginPage());
      Navigator.pushAndRemoveUntil(
          context, route, (Route<dynamic> route) => false);
    }
  }

  Container buildDot(int index, BuildContext context) {
    // double dotWidth = _currentPage == index ? 25 : 10;
    return Container(
      height: 10,
      width: 25,
      margin: const EdgeInsets.only(right: 7),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20.0),
          color: _currentPage == index ? AppColor.green : Colors.transparent,
          border: Border.all(
            color: const Color.fromARGB(255, 224, 224, 224),
            width: 1,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: onboards.length,
        onPageChanged: (int index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (BuildContext context, int index) {
          return OnboardDetailsPage(
            item: onboards[index],
            onNextPressed: goToNextPage,
            nextButtonText:
                _currentPage < onboards.length - 1 ? 'Next' : 'Get Started',
            buildDot: buildDot,
          );
        },
      ),
    );
  }
}
