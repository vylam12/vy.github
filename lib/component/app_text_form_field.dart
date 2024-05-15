import 'package:cuoiki/resources/app_color.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.controller,
    required this.isPassword,
    this.textInputAction,
    required this.hintText,
    this.icon,
    this.onChanged,
    this.passwordMinLength = 8,
  });
  final TextEditingController? controller;
  final bool isPassword;
  final String hintText;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;
  final Icon? icon;
  final int passwordMinLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 60.0,
      width: 382.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: const Color.fromRGBO(212, 212, 212, 1)),
        color: AppColor.grey.withOpacity(0.5),
      ),

      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      // margin: EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
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