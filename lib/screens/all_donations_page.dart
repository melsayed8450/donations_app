import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllDonationsPage extends StatefulWidget {
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
  State<AllDonationsPage> createState() => _AllDonationsPageState();
}

class _AllDonationsPageState extends State<AllDonationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 73, 4, 218),
        leading: IconButton(
          icon: Icon(
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
              TableRow(children: [
                Center(child: Text('ID')),
                Center(child: Text('Currency')),
                Center(child: Text('Amount')),
                Center(child: Text('Name')),
                Center(child: Text('Message')),
              ]),
              for (int i = 0; i < widget.words!.length; i++)
                TableRow(children: [
                  Center(child: Text(widget.ids![i])),
                  Center(child: Text(widget.currency![i])),
                  Center(child: Text(widget.amounts![i])),
                  Center(child: Text(widget.names![i])),
                  Center(child: Text(widget.words![i])),
                ])
            ],
          ),
        ),
      ),
    );
  }
}
