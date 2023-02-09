import 'package:donation_app/custom_widgets/custom_text_field.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../models/donate_page_get.dart';



class CustomDropDownButton extends StatelessWidget {
  CustomDropDownButton({super.key});

  final donatePageGet = Get.put(DonatePageGet());

  String value = '\$';

  @override
  Widget build(BuildContext context) {
    final screen_height = MediaQuery.of(context).size.height;
    final screen_width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screen_width * 0.1),
      child: Row(
        children: [
          DropdownButtonHideUnderline(
            child: DropdownButton2(
              icon: Icon(Icons.arrow_downward),
              hint: Obx(() {
                return Text(donatePageGet.currency.value);
              }),
              items: donatePageGet.amountList.map((String item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (item) {
                donatePageGet.currency.value = item!;
              },
            ),
          ),
          CustomTextField(
            hintText: '200',
            height: 60,
            width: screen_width * 0.63,
            controller: donatePageGet.amount,
          )
        ],
      ),
    );
  }
}
