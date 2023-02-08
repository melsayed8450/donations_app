import 'package:donation_app/models/creator_object.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DonatePageGet extends GetxController {
  final amount = TextEditingController().obs;
  final name = TextEditingController().obs;
  final saySomthing = TextEditingController().obs;
  final currency = '\$'.obs;
}
