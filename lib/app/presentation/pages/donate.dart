import 'package:donation_app/app/presentation/widgets/custom_drop_down_button.dart';
import 'package:donation_app/app/presentation/widgets/custom_text_field.dart';
import 'package:donation_app/app/domain/entities/creator_entity.dart';
import 'package:donation_app/app/presentation/manager/donate_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonatePage extends StatelessWidget {
  DonatePage({super.key, required this.creator});
  final Creator creator;
  final donatePageGet = Get.put(DonateController());

  @override
  Widget build(BuildContext context) {
    final screenHeight = context.height;
    final screenWidth = context.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Row(
          children: [
            CircleAvatar(backgroundImage: AssetImage(creator.imagePath)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
              child: Text(
                creator.name,
                style: const TextStyle(color: Colors.black),
              ),
            ),
            const Icon(Icons.verified, color: Colors.blue)
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.04),
              child: Text(
                'Send your Love to ${creator.name} to \n         Become a real Fan',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            CustomDropDownButton(),
            Padding(
              padding: EdgeInsets.all(screenHeight * 0.03),
              child: CustomTextField(
                  hintText: 'Your name (optional)',
                  height: 60,
                  width: screenWidth * 0.8,
                  controller: donatePageGet.name),
            ),
            CustomTextField(
              hintText: 'Say somthing nice (optional)',
              height: screenHeight * 0.2,
              width: screenWidth * 0.8,
              controller: donatePageGet.saySomthing,
              maxLines: 5,
            ),
            SizedBox(
              height: screenHeight * 0.25,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                width: screenWidth * 0.45,
                height: screenHeight * 0.06,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(30)),
                child: TextButton(
                  onPressed: () {
                    donatePageGet.onSupportbuttonPress(context, creator);
                  },
                  child: Obx(() {
                    return Text(
                      // ignore: unnecessary_null_comparison
                      donatePageGet.amount == null
                          ? 'Support'
                          : 'Support ${donatePageGet.currency}${donatePageGet.amount.value.text}',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    );
                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
