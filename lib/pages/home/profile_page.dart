import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import '../../SQLite/database_helper.dart';
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

  Future<String?> getProfileImage() async {
    return await db.getUserImageById(widget.userId);
  }

  @override
  void initState() {
    super.initState();
    getProfileImage().then((String? imagePath) {
      if (imagePath != null) {
        setState(() {
          image = File(imagePath);
        });
      }
    });
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

  Future<void> pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);

      // Save image to database
      if (widget.userId != null) {
        db.addImageToUser(widget.userId, image.path);
      }
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
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
                Positioned(
                    bottom: 0.0,
                    right: 0.0,
                    child: GestureDetector(
                      onTap: () => pickImage(),
                      child: Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          border: Border.all(color: AppColor.green, width: 2.0),
                          color: AppColor.textButton.withOpacity(0.9),
                        ),
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          color: AppColor.green,
                          size: 27.0,
                        ),
                      ),
                    ))
              ],
            ),
            const SizedBox(height: 20.0),
            Container(
              width: 372.0,
              decoration: BoxDecoration(
                  color: AppColor.textButton,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                      color: const Color.fromRGBO(212, 212, 212, 1))),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: const Row(
                          children: [
                            Icon(Icons.person),
                            Text('About me'),
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
                      child: GestureDetector(
                        onTap: logout,
                        child: const Row(children: [
                          Icon(
                            Icons.sign_language,
                          ),
                          Text('Sign out'),
                        ]),
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
