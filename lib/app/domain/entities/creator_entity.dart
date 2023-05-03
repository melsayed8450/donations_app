import 'package:flutter/material.dart';

class Creator {
  final String name;
  final String title;
  final String imagePath;
  final Color color;
  final String id;
  bool isFav;
  Creator(
      {required this.name,
      required this.title,
      required this.imagePath,
      required this.color,
      required this.id,
      this.isFav = false});
}
