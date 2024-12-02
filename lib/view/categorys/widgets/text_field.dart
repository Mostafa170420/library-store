import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.title,
      required this.textInputType,
      required this.controller});
  final String title;
  final TextInputType textInputType;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        controller: controller,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
            labelText: title,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            )),
        validator: (value) {
          if (value!.isEmpty) {
            return "مطلوب";
          } else {
            return null;
          }
        },
      ),
    );
  }
}
