import 'package:donation_app/models/creator_object.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/all_donations_page.dart';

class HomePageGet extends GetxController {
  final creatorsList = [
    Creator(
        id: 'C1',
        name: 'BB ki Vines',
        title: 'Youtuber',
        image_path: 'assets/images/BB ki Vines.png',
        color: Colors.red),
    Creator(
        id: 'C2',
        name: 'MrBeast',
        title: 'Youtuber',
        image_path: 'assets/images/MrBeast.png',
        color: Colors.purple),
    Creator(
        id: 'C3',
        name: 'Carryminati',
        title: 'Youtuber',
        image_path: 'assets/images/carryminati.jpg',
        color: Colors.yellow),
    Creator(
        id: 'C4',
        name: 'Markiplier',
        title: 'Youtuber',
        image_path: 'assets/images/Markiplier.png',
        color: Colors.red),
    Creator(
        id: 'C5',
        name: 'Mohamed Adnan',
        title: 'Youtuber',
        image_path: 'assets/images/Mohamed Adnan.png',
        color: Colors.purple),
    Creator(
        id: 'C6',
        name: 'Saba7o Kora',
        title: 'Youtuber',
        image_path: 'assets/images/Saba7o Kora.png',
        color: Colors.yellow),
    Creator(
        id: 'C7',
        name: 'Zach King',
        title: 'Youtuber',
        image_path: 'assets/images/Zach King.png',
        color: Colors.red),
  ].obs;

  void onAllDonationsButtonPressed() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? ids = prefs.getStringList('ids') ?? [];
    List<String>? amounts = prefs.getStringList('amounts') ?? [];
    List<String>? names = prefs.getStringList('names') ?? [];
    List<String>? words = prefs.getStringList('words') ?? [];
    List<String>? currency = prefs.getStringList('currency') ?? [];
    await Get.to(() => AllDonationsPage(
          ids: ids,
          names: names,
          words: words,
          currency: currency,
          amounts: amounts,
        ));
  }
}
