import 'dart:io';
import 'package:carepet/pages/home/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import '../../SQLite/database_helper.dart';
import '../../component/app_elevated_button.dart';
import '../../component/app_text_field.dart';
import '../../models/pet.dart';
import '../../resources/app_color.dart';

class AddPetPage extends StatefulWidget {
  const AddPetPage({super.key, required this.userId});
  final int userId;
  @override
  State<AddPetPage> createState() => _AddPetPageState();
}

class _AddPetPageState extends State<AddPetPage> {
  File? image;
  String? imagePath;
  String? gender;
  final height = TextEditingController();
  final weight = TextEditingController();
  final petName = TextEditingController();
  final breedName = TextEditingController();
  final age = TextEditingController();
  final color = TextEditingController();
  final db = DatabaseHelper();
  List<Pets> pets = [];
  @override
  void initState() {
    super.initState();
  }

  String validate() {
    if (petName.text.isEmpty) {
      return 'Please enter your pet\'s name';
    } else if (breedName.text.isEmpty) {
      return 'Please enter pet breed';
    } else if (height.text.isEmpty) {
      return 'Please enter your pet\'s height';
    } else if (!isNumeric(height.text)) {
      return 'Height must be a number';
    } else if (weight.text.isEmpty) {
      return 'Please enter your pet\'s weight';
    } else if (!isNumeric(weight.text)) {
      return 'Weight must be a number';
    } else if (gender == null) {
      return 'Please select your pet\'s gender';
    } else if (age.text.isEmpty) {
      return 'Please enter your pet\'s age';
    } else if (!isNumeric(age.text)) {
      return 'Age must be a number';
    } else if (color.text.isEmpty) {
      return 'Please enter your pet\'s color';
    }
    return 'isChecked';
  }

  bool isNumeric(String str) {
    if (str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }

  Future<void> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() {
      this.image = imageTemporary;
      imagePath = imageTemporary.path;
    });
  }

  Future<void> addPet() async {
    String validationResult = validate();
    if (validationResult != 'isChecked') {
      final snackBar = SnackBar(
        content: Text(validationResult),
        duration: const Duration(seconds: 2),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    // Kiểm tra hình ảnh
    if (image == null) {
      final snackBar = SnackBar(
        content: Text('Please select an image for your pet.😓'),
        duration: const Duration(seconds: 2),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    double heightValue = double.tryParse(height.text) ?? 0.0;
    double weightValue = double.tryParse(weight.text) ?? 0.0;
    int ageValue = int.tryParse(age.text) ?? 0;
    try {
      Pets myPet = Pets(
        imgStr: image!.path,
        name: petName.text,
        breedName: breedName.text,
        color: color.text,
        userId: widget.userId,
        height: heightValue,
        weight: weightValue,
        age: ageValue,
        gender: gender ?? '',
      );
      var insertedPetId = await db.addPetForUser(widget.userId, myPet);
      if (insertedPetId > 0) {
        if (!mounted) return;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DashBoardPage(userId: widget.userId),
          ),
        );

        final snackBar = SnackBar(
          content: Text('Added pets successfully! 😘'),
          duration: Duration(seconds: 2),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        throw Exception('More failed pets 😓');
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: AppColor.green,
          title: const Text(
            'Add Pet',
            style: TextStyle(color: AppColor.textButton),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DashBoardPage(
                            userId: widget.userId,
                          )));
            },
          )),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const Gap(10.0),
                Stack(
                  children: [
                    SizedBox(
                      width: 120.0,
                      height: 120.0,
                      child: image != null
                          ? CircleAvatar(
                              radius: 50.0,
                              backgroundImage: FileImage(image!),
                            )
                          : const CircleAvatar(
                              radius: 50.0,
                              backgroundImage:
                                  AssetImage('assets/images/nguoidung.png'),
                            ),
                    ),
                    Positioned(
                        bottom: 5.0,
                        right: 7.0,
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
                const Gap(20),
                AppTextField(
                  text: 'Pet Name',
                  controller: petName,
                  width: 353.0,
                  textInputAction: TextInputAction.next,
                ),
                const Gap(15),
                AppTextField(
                  text: 'Breed Name',
                  width: 353.0,
                  controller: breedName,
                  textInputAction: TextInputAction.next,
                ),
                const Gap(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AppTextField(
                      text: 'Height',
                      width: 172.0,
                      controller: height,
                      textInputAction: TextInputAction.next,
                    ),
                    AppTextField(
                      text: 'Weight',
                      controller: weight,
                      width: 172.0,
                      textInputAction: TextInputAction.next,
                    )
                  ],
                ),
                const Gap(15),
                SizedBox(
                  width: 353,
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
                const Gap(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AppTextField(
                      text: 'Age',
                      width: 172.0,
                      controller: age,
                      textInputAction: TextInputAction.next,
                    ),
                    AppTextField(
                      text: 'Color',
                      controller: color,
                      textInputAction: TextInputAction.done,
                      width: 172.0,
                    )
                  ],
                ),
                const Gap(24),
                AppElevatedButton(
                  height: 51.0,
                  width: 358.0,
                  text: 'Add Pet',
                  textColor: AppColor.textButton,
                  color: AppColor.green,
                  borderColor: AppColor.green,
                  onPressed: addPet,
                ),
                const Gap(24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
