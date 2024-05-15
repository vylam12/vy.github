import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DogField extends StatelessWidget {
  const DogField(
      {super.key, required this.petName, required this.petImage, this.onTap});
  final String petName;
  final String petImage;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 100.0,
            width: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.file(
                  File(petImage),
                  fit: BoxFit.cover,
                )),
          ),
        ),
        Text(petName),
      ],
    );
  }
}
