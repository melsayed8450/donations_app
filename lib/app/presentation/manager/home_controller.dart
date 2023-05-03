import 'package:donation_app/app/domain/entities/creator_entity.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/all_donations.dart';

class HomeController extends GetxController {
  final creatorsList = [
    Creator(
        id: 'C1',
        name: 'BB ki Vines',
        title: 'Youtuber',
        imagePath: 'assets/images/BB ki Vines.png',
        color: Colors.red),
    Creator(
        id: 'C2',
        name: 'MrBeast',
        title: 'Youtuber',
        imagePath: 'assets/images/MrBeast.png',
        color: Colors.purple),
    Creator(
        id: 'C3',
        name: 'Carryminati',
        title: 'Youtuber',
        imagePath: 'assets/images/carryminati.jpg',
        color: Colors.yellow),
    Creator(
        id: 'C4',
        name: 'Markiplier',
        title: 'Youtuber',
        imagePath: 'assets/images/Markiplier.png',
        color: Colors.red),
    Creator(
        id: 'C5',
        name: 'Mohamed Adnan',
        title: 'Youtuber',
        imagePath: 'assets/images/Mohamed Adnan.png',
        color: Colors.purple),
    Creator(
        id: 'C6',
        name: 'Saba7o Kora',
        title: 'Youtuber',
        imagePath: 'assets/images/Saba7o Kora.png',
        color: Colors.yellow),
    Creator(
        id: 'C7',
        name: 'Zach King',
        title: 'Youtuber',
        imagePath: 'assets/images/Zach King.png',
        color: Colors.red),
  ];
  final isFavourite = List<bool>.filled(7, false).obs;

  @override
  void onInit() async {
    super.onInit();
    final prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < 7; i++) {
      isFavourite[i] = prefs.getBool('${creatorsList[i].id}fav') ?? false;
    }
  }

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
