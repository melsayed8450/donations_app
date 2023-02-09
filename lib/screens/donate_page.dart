import 'package:donation_app/custom_widgets/custom_drop_down_button.dart';
import 'package:donation_app/custom_widgets/custom_text_field.dart';
import 'package:donation_app/models/creator_object.dart';
import 'package:donation_app/models/donate_page_get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DonatePage extends StatelessWidget {
  DonatePage({super.key, required this.creator});
  final Creator creator;
  final donatePageGet = Get.put(DonatePageGet());

  @override
  Widget build(BuildContext context) {
    final screen_height = MediaQuery.of(context).size.height;
    final screen_width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Row(
          children: [
            CircleAvatar(backgroundImage: AssetImage(creator.image_path)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screen_width * 0.03),
              child: Text(
                creator.name,
                style: TextStyle(color: Colors.black),
              ),
            ),
            Icon(Icons.verified, color: Colors.blue)
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: screen_height * 0.04),
              child: Text(
                'Send your Love to ${creator.name} to \n         Become a real Fan',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            CustomDropDownButton(),
            Padding(
              padding: EdgeInsets.all(screen_height * 0.03),
              child: CustomTextField(
                  hintText: 'Your name (optional)',
                  height: 60,
                  width: screen_width * 0.8,
                  controller: donatePageGet.name),
            ),
            CustomTextField(
              hintText: 'Say somthing nice (optional)',
              height: screen_height * 0.2,
              width: screen_width * 0.8,
              controller: donatePageGet.saySomthing,
              maxLines: 5,
            ),
            SizedBox(
              height: screen_height * 0.25,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                width: screen_width * 0.45,
                height: screen_height * 0.06,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(30)),
                child: TextButton(
                  onPressed: () {
                    donatePageGet.onSupportbuttonPress(context, creator);
                  },
                  child: Obx(() {
                    return Text(
                      donatePageGet.amount == null
                          ? 'Support'
                          : 'Support ${donatePageGet.currency}${donatePageGet.amount.value.text}',
                      style: TextStyle(
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
