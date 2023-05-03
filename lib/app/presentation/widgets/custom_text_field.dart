import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.height,
      required this.width,
      required this.controller,
      this.maxLines = 1,
      });
  final String hintText;
  final double height;
  final double width;
  final TextEditingController controller;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    final screenWidth = context.width;

    return SizedBox(
      width: width,
      height: height,
      child: TextField(
        keyboardType: width == screenWidth * 0.8
            ? TextInputType.text
            : TextInputType.number,
        maxLines: maxLines,
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(5)),
          hintText: hintText,
        ),
      ),
    );
  }
}
