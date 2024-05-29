import 'package:carepet/pages/home/loading_page.dart';
import 'package:carepet/pages/home/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      //kt trạng thái login status sử dụng FutureBuilder
      future: isLoggedIn(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(); // Tiện ích giữ chỗ trong khi chờ tương lai hoàn thành
        } else {
          if (snapshot.hasError) {
            return Container(); // Tiện ích giữ chỗ trong trường hợp có lỗi
          } else {
            if (snapshot.data == true) {
              //  người dùng đã đăng nhập
              return MaterialApp(
                title: 'Flutter Demo',
                theme: ThemeData(
                  useMaterial3: true,
                ),
                debugShowCheckedModeBanner: false,
                home: FutureBuilder<int>(
                  // kiểm tra trạng thái userId sử dụng FutureBuilder
                  future: getUserId(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(); // Tiện ích giữ chỗ trong khi chờ tương lai hoàn thành
                    } else {
                      if (snapshot.hasError) {
                        return Container(); // Tiện ích giữ chỗ trong trường hợp có lỗi
                      } else {
                        return LoadingPage(userId: snapshot.data ?? 0);
                      }
                    }
                  },
                ),
              );
            } else {
              //  người dùng chưa login
              return MaterialApp(
                title: 'Flutter Demo',
                theme: ThemeData(
                  useMaterial3: true,
                ),
                debugShowCheckedModeBanner: false,
                home: const SplashPage(),
              );
            }
          }
        }
      },
    );
  }

  Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    return isLoggedIn;
  }

  Future<int> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt('userId') ?? 0;
    return userId;
  }
}
