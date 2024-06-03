import 'dart:io';
import 'package:carepet/pages/pet/pet_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import '../../SQLite/database_helper.dart';
import '../../component/app_elevated_button.dart';
import '../../component/app_text_field.dart';
import '../../models/pet.dart';
import '../../resources/app_color.dart';

class UpdatePetDetailPage extends StatefulWidget {
  const UpdatePetDetailPage(
      {super.key, required this.petId, required this.userId});
  final int petId;
  final int userId;
  @override
  State<UpdatePetDetailPage> createState() => _UpdatePetDetailPageState();
}

class _UpdatePetDetailPageState extends State<UpdatePetDetailPage> {
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
  Pets pet = Pets(
      age: 0,
      // breedName: "breedName",
      // name: "name",
      // color: "color",
      breedName: '',
      name: '',
      color: '',
      height: 123,
      userId: 0,
      // gender: "",
      weight: 0,
      imgStr: '');

  Future<String?> getPetImage() async {
    return await db.getPetImageById(widget.petId);
  }

  @override
  void initState() {
    super.initState();
    getPets(widget.petId);
    // loadPetsValue(pet);
    getPetImage().then((String? imagePath) {
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
    if (widget.petId != null) {
      db.addImageToPet(widget.petId, image.path);
    }
  }

  // Future<void> loadPetsValue(Pets pet) async {
  //   height.text = pet.height.toString();
  //   weight.text = pet.weight.toString();
  //   petName.text = pet.name.toString();
  //   breedName.text = pet.breedName.toString();
  //   gender = pet.gender.toString();
  //   age.text = pet.age.toString();
  //   color.text = pet.color.toString();
  // }

  // Future<void> getPets(int petId) async {
  //   var petData = await db.getPetById(petId);
  //   await loadPetsValue(petData);
  //   setState(() {
  //     pet = petData;
  //   });
  // }
  Future<void> getPets(int petId) async {
    var petData = await db.getPetById(petId);
    // await loadPetsValue(petData);
    if (petData != null) {
      setState(() {
        pet = petData;
        height.text = pet.height.toString();
        weight.text = pet.weight.toString();
        petName.text = pet.name.toString();
        breedName.text = pet.breedName.toString();
        gender = pet.gender.toString();
        age.text = pet.age.toString();
        color.text = pet.color.toString();
        imagePath = pet.imgStr;
      });
      print(imagePath);
    }
  }

  Future<void> updatePets() async {
    if (gender == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select gender")),
      );
      return;
    }
    final updateData = {
      'imgStr': imagePath,
      'height': height.text,
      'weight': weight.text,
      'name': petName.text,
      'breedName': breedName.text,
      'gender': gender,
      'age': age.text,
      'color': color.text
    };
    // Map<String, dynamic> updateData = {
    //   "imgStr": image != null ? image!.path : '',
    //   "height": height.text,
    //   "weight": weight.text,
    //   "name": petName.text,
    //   "breedName": breedName.text,
    //   "gender": gender,
    //   "age": age.text,
    //   "color": color.text
    // };

    var result = await db.updatePetById(updateData, widget.petId);
    if (result == 1) {
      var petData = await db.getPetById(widget.petId);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => PetDetailPage(
                pet: petData,
                userId: widget.userId,
              )));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Update success!!! 😘"),
        duration: Duration(seconds: 2),
      ));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Update failed!!!😣")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColor.green,
        title: const Text('Update Pet',
            style: TextStyle(color: AppColor.textButton)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
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
                              border:
                                  Border.all(color: AppColor.green, width: 2.0),
                              color: AppColor.textButton.withOpacity(0.9),
                            ),
                            child: const Icon(Icons.camera_alt_outlined,
                                color: AppColor.green, size: 27.0),
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
                const SizedBox(height: 24.0),
                AppElevatedButton(
                  height: 51.0,
                  width: 358.0,
                  text: 'Update Pet',
                  textColor: AppColor.textButton,
                  color: AppColor.green,
                  borderColor: AppColor.green,
                  onPressed: () {
                    updatePets();
                  },
                ),
                const SizedBox(height: 24.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
