import 'package:flutter/material.dart';

import '../resources/app_color.dart';

class AppTextFormField extends StatelessWidget {
  AppTextFormField({
    super.key,
    this.controller,
    required this.isPassword,
    this.textInputAction,
    required this.hintText,
    this.icon,
    this.onChanged,
    this.passwordMinLength = 8,
    this.readOnly = false,
    this.color = const Color.fromRGBO(204, 204, 204, 0.5),
  });
  final TextEditingController? controller;
  final bool isPassword;
  final String hintText;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;
  final Icon? icon;
  final bool readOnly;
  final int passwordMinLength;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 382.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: const Color.fromRGBO(212, 212, 212, 1)),
        color: color,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        readOnly: readOnly,
        obscureText: isPassword,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          icon: icon,
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
