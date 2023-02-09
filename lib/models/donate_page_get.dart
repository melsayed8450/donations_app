import 'package:donation_app/models/creator_object.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DonatePageGet extends GetxController {
  final amount = TextEditingController().obs;
  final name = TextEditingController().obs;
  final saySomthing = TextEditingController().obs;
  final currency = '\$'.obs;

  List<String> amountList = ['\$', '€', '£', '¥'].obs;

  void onSupportbuttonPress(BuildContext context, Creator creator) async {
    if (!amount.value.text.isEmpty) {
      final prefs = await SharedPreferences.getInstance();
      List<String>? ids = prefs.getStringList('ids') ?? [];
      List<String>? amounts = prefs.getStringList('amounts') ?? [];
      List<String>? names = prefs.getStringList('names') ?? [];
      List<String>? words = prefs.getStringList('words') ?? [];
      List<String>? currencies = prefs.getStringList('currency') ?? [];
      ids.add(creator.id);
      amounts.add(amount.value.text);
      names.add(!name.value.text.isEmpty ? name.value.text : '-');
      words.add(!saySomthing.value.text.isEmpty ? saySomthing.value.text : '-');
      currencies.add(currency.value);
      prefs.setStringList('ids', ids);
      prefs.setStringList('names', names);
      prefs.setStringList('amounts', amounts);
      prefs.setStringList('words', words);
      prefs.setStringList('currency', currencies);

      Navigator.pop(context);
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(creator.name),
          content: const Text('Thanks for your support'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('Error'),
          content: const Text('Please enter the amount'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
