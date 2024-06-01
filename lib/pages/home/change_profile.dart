import 'dart:io';
import 'package:carepet/component/app_text_field.dart';
import 'package:carepet/component/app_text_form_field.dart';
import 'package:carepet/pages/home/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import '../../SQLite/database_helper.dart';
import '../../component/app_elevated_button.dart';
import '../../models/users.dart';
import '../../resources/app_color.dart';

class ChangeProfile extends StatefulWidget {
  const ChangeProfile({super.key, required this.userId});
  final int userId;

  @override
  State<ChangeProfile> createState() => _ChangeProfileState();
}

class _ChangeProfileState extends State<ChangeProfile> {
  File? image;
  String? imagePath;
  String? userImage;
  String? gender;
  final userInfoNotifier = ValueNotifier<Users?>(null);
  final phone = TextEditingController();
  final usrName = TextEditingController();
  final adress = TextEditingController();
  final gmail = TextEditingController();
  final db = DatabaseHelper();
  Users user = Users(
    imgStr: '',
    adress: '',
    email: '',
    phone: '',
  );
  bool isPhoneNumber(String value) {
    final phoneRegex = r'^[0-9]{10}$';
    final RegExp regex = RegExp(phoneRegex);
    return regex.hasMatch(value);
  }

  Future<String?> getUserImage() async {
    return await db.getUserImageById(widget.userId);
  }

  @override
  void initState() {
    super.initState();
    getUser(widget.userId);
    getUserImage().then((String? imagePath) {
      if (imagePath != null) {
        setState(() {
          image = File(imagePath);
        });
      }
    });
  }

  Future<void> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() {
      this.image = imageTemporary;
      imagePath = imageTemporary.path;
    });
    if (widget.userId != null) {
      db.addImageToUser(widget.userId, image.path);
    }
  }

  Future<void> getUser(int usrId) async {
    var usrData = await db.getUserInfo(usrId);
    if (usrData != null) {
      setState(() {
        user = usrData!;
        usrName.text = user.usrName ?? '';
        phone.text = user.phone ?? '';
        adress.text = user.adress ?? '';
        gmail.text = user.email ?? '';
        gender = user.gender;
        imagePath = user.imgStr;
      });
    }
  }

  Future<void> updateUserProfile() async {
    if (usrName.text.isNotEmpty &&
        phone.text.isNotEmpty &&
        adress.text.isNotEmpty &&
        isPhoneNumber(phone.text)) {
      final updatedUserData = {
        'usrName': usrName.text,
        'phone': phone.text,
        'adress': adress.text,
        'gender': gender,
        'imgStr': imagePath, // Cập nhật hình ảnh nếu có
      };
      final res = await db.updateUserById(updatedUserData, widget.userId);
      if (res > 0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DashBoardPage(userId: widget.userId),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Profile updated successfully.'),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a valid phone number.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColor.green,
          title: const Text(
            'Change Profile ',
            style: TextStyle(color: AppColor.textButton),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: AppColor.textButton,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DashBoardPage(
                            userId: widget.userId,
                          )));
            },
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const Gap(20),
              Center(
                child: Stack(
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
                              border:
                                  Border.all(color: AppColor.green, width: 2.0),
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
              ),
              const Gap(10),
              AppTextField(
                text: 'User name',
                controller: usrName,
                textInputAction: TextInputAction.next,
              ),
              const Gap(10),
              AppTextFormField(
                  isPassword: false,
                  hintText: 'Email',
                  controller: gmail,
                  color: AppColor.textButton,
                  textInputAction: TextInputAction.next,
                  readOnly: true),
              const Gap(10),
              AppTextField(
                text: 'Phone',
                controller: phone,
                textInputAction: TextInputAction.next,
              ),
              const Gap(10),
              AppTextField(
                text: 'Adress',
                controller: adress,
                textInputAction: TextInputAction.next,
              ),
              const Gap(10),
              SizedBox(
                width: 400,
                child: DropdownButtonFormField<String>(
                  value: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                  items: const [
                    DropdownMenuItem(
                      value: 'Male',
                      child: Text('Male'),
                    ),
                    DropdownMenuItem(
                      value: 'Female',
                      child: Text('Female'),
                    ),
                  ],
                  decoration: InputDecoration(
                    hintText: 'Gender',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(212, 212, 212, 1)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(212, 212, 212, 1)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              const Gap(20),
              AppElevatedButton(
                height: 51.0,
                width: 358.0,
                text: 'Save',
                textColor: AppColor.textButton,
                color: AppColor.green,
                borderColor: AppColor.green,
                onPressed: updateUserProfile,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
