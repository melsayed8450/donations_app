import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class AllDonationsPage extends StatelessWidget {
  AllDonationsPage(
      {super.key,
      this.ids,
      this.amounts,
      this.currency,
      this.names,
      this.words});
  List<String>? ids;
  List<String>? amounts;
  List<String>? names;
  List<String>? words;
  List<String>? currency;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 73, 4, 218),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Table(
            border: TableBorder.all(),
            children: [
              const TableRow(children: [
                Center(child: Text('ID')),
                Center(child: Text('Currency')),
                Center(child: Text('Amount')),
                Center(child: Text('Name')),
                Center(child: Text('Message')),
              ]),
              for (int i = 0; i < words!.length; i++)
                TableRow(children: [
                  Center(child: Text(ids![i])),
                  Center(child: Text(currency![i])),
                  Center(child: Text(amounts![i])),
                  Center(child: Text(names![i])),
                  Center(child: Text(words![i])),
                ])
            ],
          ),
        ),
      ),
    );
  }
}
