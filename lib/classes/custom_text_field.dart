import 'package:flutter/material.dart';
import 'package:uber_ui/classes/custom_text.dart';

class CustomTextField extends StatelessWidget {
  final String name;
  final String hintText;
  final TextEditingController controller;
  final bool obsecureText;
  final TextInputType? keyboardType;
  const CustomTextField(
      {super.key,
      required this.name,
      required this.hintText,
      this.obsecureText = false,
      this.keyboardType,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: name,
          textColor: Colors.black,
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          style: const TextStyle(color: Colors.black),
          obscureText: obsecureText,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter your $name';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Color(0XFF535353)),
            filled: true,
            fillColor: const Color.fromARGB(255, 223, 218, 218),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0XFF979797), width: 0.5),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2.0),
            ),
          ),
        ),
      ],
    );
  }
}
