import 'package:carepet/models/users.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../SQLite/database_helper.dart';
import '../../component/dog_field.dart';
import '../../component/food_item.dart';
import '../../component/pet_status.dart';
import '../../models/food.dart';
import '../../models/pet.dart';
import '../../resources/app_color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../pet/add_pet_page.dart';
import '../pet/pet_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.userId});
  final int userId;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Pets> _pets = [];
  final db = DatabaseHelper();
  @override
  void initState() {
    super.initState();
    _loadPets();
    usr();
  }

  Future<void> _loadPets() async {
    var pets = await db.getPetsByUserId(widget.userId);
    if (pets != null) {
      setState(() {
        _pets = pets;
      });
    }
  }

  void _navigateToPetDetail(Pets pet) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PetDetailPage(pet: pet, userId: widget.userId),
      ),
    );
  }

  Future<void> _deletePet(Pets pet) async {
    bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Delete Pet 😣',
            style: GoogleFonts.fredoka(
                fontSize: 22.0,
                textStyle: const TextStyle(fontWeight: FontWeight.w600)),
          ),
          content: Text(
            'Are you sure you want to delete pet ${pet.name}?',
            style: GoogleFonts.fredoka(
                fontSize: 18.0,
                textStyle: const TextStyle(fontWeight: FontWeight.w400)),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );

    if (confirmed == true) {
      var result = await db.deletePetById(pet.id!);
      if (result == 1) {
        setState(() {
          _pets.remove(pet);
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Pet ${pet.name} has been deleted.'),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Failed to delete pet ${pet.name}.'),
        ));
      }
    }
  }

  final userInfoNotifier = ValueNotifier<Users?>(null);
  Future<void> usr() async {
    final userInfo = await db.getUserInfo(widget.userId);
    userInfoNotifier.value = userInfo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.green,
        title: userInfoNotifier.value != null
            ? Text(
                'Welcome ${userInfoNotifier.value!.usrName}' ?? 'Welcome...',
                style: GoogleFonts.fredoka(
                    fontSize: 20.0,
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.white)),
              )
            : const Text('Welcome...'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0).copyWith(
              top: MediaQuery.of(context).padding.top + 20.0, bottom: 20.0),
          child: Column(
            children: [
              (_pets.isNotEmpty)
                  ? Container(
                      height: 190.0,
                      width: 400.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.15),
                            blurRadius: 43.78,
                            spreadRadius: 0,
                            offset: Offset(0, 5.47),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Gap(10),
                          Row(
                            children: [
                              const Gap(10),
                              const Icon(
                                Icons.pets_outlined,
                              ),
                              const Gap(5),
                              Text(
                                'My Pet',
                                style: GoogleFonts.fredoka(
                                    fontSize: 19.0,
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w700)),
                              ),
                            ],
                          ),
                          const Gap(10),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Gap(10),
                                for (var pet in _pets)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    child: DogField(
                                      onTap: () => _navigateToPetDetail(pet),
                                      onLongPress: () => _deletePet(pet),
                                      petName: pet.name ?? '',
                                      petImage: pet.imgStr?.isNotEmpty == true
                                          ? pet.imgStr!
                                          : '',
                                    ),
                                  ),
                                const Gap(10),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      height: 190.0,
                      width: 400.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.15),
                            blurRadius: 43.78,
                            spreadRadius: 0,
                            offset: Offset(0, 5.47),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                const Gap(10),
                                const Icon(
                                  Icons.pets_outlined,
                                ),
                                const Gap(5),
                                Text(
                                  'My Pet',
                                  style: GoogleFonts.fredoka(
                                      fontSize: 19.0,
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w700)),
                                ),
                              ],
                            ),
                            const Gap(20.0),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        AddPetPage(userId: widget.userId)));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 23.0),
                                child: DottedBorder(
                                  borderType: BorderType.RRect,
                                  radius: const Radius.circular(12),
                                  color: AppColor.green,
                                  child: Container(
                                    width: 90.0,
                                    height: 90.0,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                            style: BorderStyle.none)),
                                    child: const Icon(
                                      Icons.add,
                                      color: AppColor.green,
                                      size: 50.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              const Gap(20),
              (_pets.isNotEmpty)
                  ? Container(
                      width: 400.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.15),
                            blurRadius: 43.78,
                            spreadRadius: 0,
                            offset: Offset(0, 5.47),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const Gap(20),
                          Row(
                            children: [
                              const Gap(10),
                              const Icon(
                                Icons.mood_outlined,
                              ),
                              const Gap(5),
                              Text(
                                'Pet Status',
                                style: GoogleFonts.fredoka(
                                    fontSize: 19.0,
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w700)),
                              ),
                            ],
                          ),
                          const Gap(20.0),
                          Expanded(
                            child: PageView.builder(
                              itemCount: _pets.length,
                              itemBuilder: (context, index) {
                                final pet = _pets[index];
                                return PetStatus(pet);
                              },
                            ),
                          )
                        ],
                      ),
                    )
                  : Container(
                      width: 400.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.15),
                            blurRadius: 43.78,
                            spreadRadius: 0,
                            offset: Offset(0, 5.47),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const Gap(20),
                          Row(
                            children: [
                              const Gap(10),
                              const Icon(
                                Icons.mood_outlined,
                              ),
                              const Gap(5),
                              Text(
                                'Pet Status',
                                style: GoogleFonts.fredoka(
                                    fontSize: 19.0,
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w700)),
                              ),
                            ],
                          ),
                          const Gap(40.0),
                          Text('No pets',
                              style: GoogleFonts.fredoka(
                                  fontSize: 17.0,
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w400)))
                        ],
                      ),
                    ),
              const Gap(20),
              Container(
                  height: 190.0,
                  width: 400.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.15),
                        blurRadius: 43.78,
                        spreadRadius: 0,
                        offset: Offset(0, 5.47),
                      ),
                    ],
                  ),
                  child: (_pets.isNotEmpty)
                      ? Column(
                          children: [
                            const Gap(20.0),
                            Row(
                              children: [
                                const Gap(10),
                                const Icon(FontAwesomeIcons.bone),
                                const Gap(5),
                                Text(
                                  'Pet Food',
                                  style: GoogleFonts.fredoka(
                                      fontSize: 19.0,
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w700)),
                                ),
                              ],
                            ),
                            Expanded(
                              child: PageView.builder(
                                itemCount: foods.length,
                                itemBuilder: (context, index) {
                                  final food = foods[index];
                                  return FoodItem(food);
                                },
                              ),
                            )
                          ],
                        )
                      : Column(
                          children: [
                            const Gap(20.0),
                            Row(
                              children: [
                                const Gap(10),
                                const Icon(FontAwesomeIcons.bone),
                                const Gap(5),
                                Text(
                                  'Pet Food',
                                  style: GoogleFonts.fredoka(
                                      fontSize: 19.0,
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w700)),
                                ),
                              ],
                            ),
                            const Gap(30.0),
                            Text('No pet food yet',
                                style: GoogleFonts.fredoka(
                                    fontSize: 17.0,
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w400))),
                          ],
                        )),
            ],
          ),
        ),
      ),
    );
  }
}
