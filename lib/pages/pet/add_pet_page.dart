import 'dart:io';
import 'package:flutter/material.dart';
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
  final height = TextEditingController();
  final weight = TextEditingController();
  final petName = TextEditingController();
  final breedName = TextEditingController();
  final gender = TextEditingController();
  final age = TextEditingController();
  final color = TextEditingController();
  final db = DatabaseHelper();
  List<Pets> pets = []; // Danh sách thú cưng
  @override
  void initState() {
    super.initState();
    getPets();
  }

  String validate() {
    if (petName.text.isEmpty) {
      return 'Vui lòng nhập tên thú cưng';
    } else if (breedName.text.isEmpty) {
      return 'Vui lòng nhập giống thú cưng';
    } else if (height.text.isEmpty) {
      return 'Vui lòng nhập chiều cao';
    } else if (weight.text.isEmpty) {
      return 'Vui lòng nhập cân nặng';
    } else if (gender.text.isEmpty) {
      return 'Vui lòng nhập giới tính';
    } else if (age.text.isEmpty) {
      return 'Vui lòng nhập tuổi';
    } else if (color.text.isEmpty) {
      return 'Vui lòng nhập màu sắc';
    }
    return 'isChecked';
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
    if (petName.text.isEmpty ||
        breedName.text.isEmpty ||
        height.text.isEmpty ||
        weight.text.isEmpty ||
        gender.text.isEmpty ||
        age.text.isEmpty ||
        color.text.isEmpty) {
      String emptyFields = '';
      if (petName.text.isEmpty) {
        emptyFields += 'pet name, ';
      }
      if (breedName.text.isEmpty) {
        emptyFields += 'breed name, ';
      }
      if (height.text.isEmpty) {
        emptyFields += 'height, ';
      }
      if (weight.text.isEmpty) {
        emptyFields += 'weight, ';
      }
      if (gender.text.isEmpty) {
        emptyFields += 'gender, ';
      }
      if (age.text.isEmpty) {
        emptyFields += 'age, ';
      }
      if (color.text.isEmpty) {
        emptyFields += 'color, ';
      }
      final snackBar = SnackBar(
        content: Text('Please input information pet $emptyFields.'),
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
        imgStr: image != null ? image!.path : '',
        name: petName.text,
        breedName: breedName.text,
        color: color.text,
        userId: widget.userId,
        height: heightValue,
        weight: weightValue,
        age: ageValue,
        gender: gender.text,
      );
      var insertedPetId = await db.addPetForUser(widget.userId, myPet);
      if (insertedPetId > 0) {
        if (!mounted) return;
        getPets();
        Navigator.pop(context);
        // Hiển thị snackbar
        final snackBar = SnackBar(
          content: Text('Thêm thú cưng thành công!'),
          duration: Duration(seconds: 2),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        throw Exception('Thêm thú cưng thất bại');
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> getPets() async {
    try {
      if (widget.userId != null) {
        List<Pets> petList = await db.getPetsByUserId(widget.userId);
        setState(() {
          pets = petList;
        });
      }
    } catch (error) {
      final snackBar = SnackBar(
        content: Text(
            'Có lỗi xảy ra khi lấy danh sách thú cưng: $error id ${widget.userId}'),
        duration: const Duration(seconds: 2),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
            Navigator.pop(context); // Quay lại trang trước đó
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 10.0),
            Stack(
              children: [
                SizedBox(
                  width: 120.0,
                  height: 120.0,
                  child: image != null
                      ? CircleAvatar(
                          radius: 54.0,
                          backgroundImage: FileImage(image!),
                        )
                      : const CircleAvatar(
                          radius: 54.0,
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
            const SizedBox(height: 10.0),
            AppTextField(
              text: 'Pet Name',
              controller: petName,
              width: 353.0,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 15.0),
            AppTextField(
              text: 'Breed Name',
              width: 353.0,
              controller: breedName,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 15.0),
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
            const SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AppTextField(
                  text: 'Gender',
                  controller: gender,
                  textInputAction: TextInputAction.next,
                  width: 106.0,
                ),
                AppTextField(
                  text: 'Age',
                  width: 106.0,
                  controller: age,
                  textInputAction: TextInputAction.next,
                ),
                AppTextField(
                  text: 'Color',
                  controller: color,
                  textInputAction: TextInputAction.done,
                  width: 106.0,
                )
              ],
            ),
            const SizedBox(height: 24.0),
            AppElevatedButton(
              height: 51.0,
              width: 358.0,
              text: 'Add Pet',
              textColor: AppColor.textButton,
              color: AppColor.green,
              borderColor: AppColor.green,
              onPressed: () {
                addPet();
              },
            ),
            const SizedBox(height: 24.0),
            Expanded(
                child: ListView.builder(
              itemCount: pets.length,
              itemBuilder: (context, index) {
                Pets pet = pets[index];
                return ListTile(
                  title: Text(pet.name),
                  subtitle: Text(pet.breedName),
                  // Hiển thị các thông tin khác về thú cưng
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
