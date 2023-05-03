import 'package:donation_app/app/presentation/widgets/custom_text_field.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../manager/donate_controller.dart';



// ignore: must_be_immutable
class CustomDropDownButton extends StatelessWidget {
  CustomDropDownButton({super.key});

  final donatePageGet = Get.put(DonateController());

  String value = '\$';

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
      child: Row(
        children: [
          DropdownButtonHideUnderline(
            child: DropdownButton2(
              icon: const Icon(Icons.arrow_downward),
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
            width: screenWidth * 0.63,
            controller: donatePageGet.amount,
          )
        ],
      ),
    );
  }
}
