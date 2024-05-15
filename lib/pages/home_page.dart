import 'package:cuoiki/component/dog_field.dart';
import 'package:cuoiki/pages/pet_detail_page.dart';
import 'package:cuoiki/resources/app_color.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../SQLite/database_helper.dart';
import '../models/pet.dart';

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
        builder: (context) => PetDetailPage(pet: pet),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Ẩn nút quay về
      ),
      backgroundColor: Colors.white,
      body: Padding(
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
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.15),
                          blurRadius: 43.78,
                          spreadRadius: 0,
                          offset: Offset(0, 5.47),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Gap(10),
                              for (var pet in _pets)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: DogField(
                                    onTap: () => _navigateToPetDetail(pet),
                                    petName: pet.name ?? '-:-',
                                    petImage: pet.imgStr?.isNotEmpty == true
                                        ? pet.imgStr!
                                        : '',
                                  ),
                                ),
                              const Gap(10),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(
                    height: 200.0,
                    width: 400.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey[200],
                    ),
                    child: Center(
                      child: Text(
                        'Không có thú cưng',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
            const Gap(20),
            Container(
              width: 400.0,
              height: 200.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.15),
                    blurRadius: 43.78,
                    spreadRadius: 0,
                    offset: Offset(0, 5.47),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
