import 'package:cuoiki/pages/device_page.dart';
import 'package:cuoiki/pages/home_page.dart';
import 'package:cuoiki/pages/profile_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key, required this.userId}) : super(key: key);
  final int userId;
  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  final items = const [
    Icon(Icons.home, color: Colors.white),
    Icon(Icons.devices, color: Colors.white),
    Icon(Icons.pets_rounded, color: Colors.white),
  ];

  int index = 0;
  @override
  // ignore: deprecated_member_use
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          return await _showExitConfirmationDialog();
        },
        child: Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            items: items,
            index: index,
            onTap: (selctedIndex) {
              setState(() {
                index = selctedIndex;
              });
            },
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: Colors.green,
            height: 60.0,
            color: Colors.green,
            animationDuration: const Duration(microseconds: 300),
          ),
          body: Container(
              color: Colors.white,
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              child: getSelectedWidget(index: index, userId: widget.userId)),
        ),
      );

  _showExitConfirmationDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Exit Confirmation'),
          content: const Text('Are you sure you want to exit the app?'),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
            ),
          ],
        );
      },
    );
  }
}

Widget getSelectedWidget({required int index, required int userId}) {
  Widget widget;
  switch (index) {
    case 0:
      widget = HomePage(userId: userId);
      break;
    case 1:
      widget = DevicePage(userId: userId);
      break;
    default:
      widget = ProfilePage(userId: userId);
      break;
  }
  return widget;
}
