import 'package:cuoiki/pages/home/dashboard_page.dart';
import 'package:cuoiki/resources/app_color.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key, required this.userId});
  final int userId;
  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 2000), () {
      Route route = MaterialPageRoute(
          builder: (context) => DashBoardPage(userId: widget.userId));
      Navigator.pushAndRemoveUntil(
          context, route, (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.green,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/hinhcho.gif',
            ),
          ),
          Positioned(
            right: 0.0,
            left: 40.0,
            bottom: 130.0,
            child: Image.asset(
              'assets/images/loading.gif',
              width: 230.0,
              height: 230.0,
            ),
          )
        ],
      ),
    );
  }
}
