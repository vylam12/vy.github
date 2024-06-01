import 'package:carepet/pages/home/change_profile.dart';
import 'package:carepet/pages/home/change_pass.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import '../../SQLite/database_helper.dart';
import '../../models/users.dart';
import '../../resources/app_color.dart';
import '../pet/add_pet_page.dart';
import '../sign/login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.userId});
  final int userId;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? image;
  String? userImage;
  final db = DatabaseHelper();
  final userInfoNotifier = ValueNotifier<Users?>(null);
  @override
  void initState() {
    super.initState();
    usr();
    getProfileImage().then((String? imagePath) {
      if (imagePath != null) {
        setState(() {
          image = File(imagePath);
        });
      }
    });
  }

  Future<String?> getProfileImage() async {
    return await db.getUserImageById(widget.userId);
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
    await prefs.remove('userId');
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => const LoginPage()),
        (route) => false);
  }

  Future<void> usr() async {
    final userInfo = await db.getUserInfo(widget.userId);
    userInfoNotifier.value = userInfo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: GoogleFonts.fredoka(
              fontSize: 25.0,
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w500, color: Colors.white)),
        ),
        backgroundColor: AppColor.green,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const Gap(20),
            Stack(
              children: [
                image != null
                    ? CircleAvatar(
                        radius: 54.0,
                        backgroundImage: FileImage(image!),
                      )
                    : const CircleAvatar(
                        radius: 54.0,
                        backgroundImage:
                            AssetImage('assets/images/nguoidung.png')),
              ],
            ),
            const SizedBox(height: 20.0),
            Container(
              width: 372.0,
              decoration: BoxDecoration(
                color: AppColor.textButton,
                borderRadius: BorderRadius.circular(10.0),
                border:
                    Border.all(color: const Color.fromRGBO(212, 212, 212, 1)),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.15),
                      blurRadius: 43.78,
                      spreadRadius: 0,
                      offset: Offset(0, 5.47)),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ValueListenableBuilder(
                  valueListenable: userInfoNotifier,
                  builder: (context, Users? userInfo, _) {
                    if (userInfo != null) {
                      return Column(
                        children: [
                          const Gap(10),
                          Row(
                            children: [
                              Text(
                                userInfo.usrName ?? '',
                                style: GoogleFonts.fredoka(
                                    fontSize: 26.0,
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: AppColor.black)),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: logout,
                                child: Row(children: [
                                  const Icon(
                                    FontAwesomeIcons.arrowRightFromBracket,
                                    size: 15,
                                    color: Color.fromRGBO(229, 77, 77, 1),
                                  ),
                                  const Gap(10),
                                  Text(
                                    'Sign out',
                                    style: GoogleFonts.fredoka(
                                        fontSize: 13.0,
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromRGBO(
                                                229, 77, 77, 1))),
                                  ),
                                ]),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Gap(15),
                              const Icon(Icons.email_outlined),
                              const Gap(10),
                              Text(
                                userInfo.email ?? '',
                                style: GoogleFonts.poppins(
                                    fontSize: 15.0,
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.black)),
                              ),
                            ],
                          ),
                          const Gap(10),
                        ],
                      );
                    } else {
                      // Hiển thị một tiêu đề tải nếu dữ liệu đang được tải
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ),
            const Gap(10),
            Container(
              width: 372.0,
              decoration: BoxDecoration(
                color: AppColor.textButton,
                borderRadius: BorderRadius.circular(10.0),
                border:
                    Border.all(color: const Color.fromRGBO(212, 212, 212, 1)),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.15),
                      blurRadius: 43.78,
                      spreadRadius: 0,
                      offset: Offset(0, 5.47)),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10.0),
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    ChangeProfile(userId: widget.userId))),
                        child: const Row(
                          children: [
                            Icon(Icons.person),
                            Text('Change profile'),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  AddPetPage(userId: widget.userId)));
                        },
                        child: const Row(children: [
                          Icon(
                            Icons.pets_outlined,
                          ),
                          Text('Add Pet'),
                        ]),
                      ),
                    ),
                    const Gap(10),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  ChangePass(userId: widget.userId)));
                        },
                        child: const Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.key,
                              size: 20,
                            ),
                            Text('Change Password'),
                          ],
                        ),
                      ),
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
