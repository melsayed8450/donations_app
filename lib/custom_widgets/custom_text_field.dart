import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get_storage/get_storage.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.height,
      required this.width,
      required this.controller,
      this.maxLines,
      });
  final hintText;
  final double height;
  final double width;
  final controller;
  final maxLines;
  @override
  Widget build(BuildContext context) {
    final screen_height = MediaQuery.of(context).size.height;
    final screen_width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      height: height,
      child: TextField(
        keyboardType: width == screen_width * 0.8
            ? TextInputType.text
            : TextInputType.number,
        maxLines: maxLines,
        controller: controller.value,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(5)),
          hintText: hintText,
        ),
      ),
    );
  }
}
