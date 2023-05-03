import 'package:donation_app/app/domain/entities/creator_entity.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DonateController extends GetxController {
  final amount = TextEditingController();
  final name = TextEditingController();
  final saySomthing = TextEditingController();
  final currency = '\$'.obs;

  List<String> amountList = ['\$', '€', '£', '¥'];

  void onSupportbuttonPress(BuildContext context, Creator creator) async {
    if (amount.value.text.isNotEmpty) {
      final prefs = await SharedPreferences.getInstance();
      List<String>? ids = prefs.getStringList('ids') ?? [];
      List<String>? amounts = prefs.getStringList('amounts') ?? [];
      List<String>? names = prefs.getStringList('names') ?? [];
      List<String>? words = prefs.getStringList('words') ?? [];
      List<String>? currencies = prefs.getStringList('currency') ?? [];
      ids.add(creator.id);
      amounts.add(amount.value.text);
      names.add(name.value.text.isNotEmpty ? name.value.text : '-');
      words.add(saySomthing.value.text.isNotEmpty ? saySomthing.value.text : '-');
      currencies.add(currency.value);
      prefs.setStringList('ids', ids);
      prefs.setStringList('names', names);
      prefs.setStringList('amounts', amounts);
      prefs.setStringList('words', words);
      prefs.setStringList('currency', currencies);

      Get.back();
      // ignore: use_build_context_synchronously
      showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(creator.name),
          content: const Text('Thanks for your support'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Please enter the amount'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
