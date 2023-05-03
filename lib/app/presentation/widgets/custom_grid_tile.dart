import 'package:donation_app/app/domain/entities/creator_entity.dart';
import 'package:donation_app/app/presentation/pages/donate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../manager/home_controller.dart';

class CustomGridTile extends StatelessWidget {
  CustomGridTile({
    super.key,
    required this.creator,
    required this.index,
  });

  final controller = Get.put(HomeController());
  final int index;
  final Creator creator;
  @override
  Widget build(BuildContext context) {
    final screenHeight = context.height;
    final screenWidth = context.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth / 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton(
            onPressed: () async {
              await Get.to(() => DonatePage(
                    creator: creator,
                  ));
            },
            child: Container(
              height: screenHeight / 6.5,
              width: screenWidth / 2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black,
                    creator.color,
                  ],
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Image.asset(
                creator.imagePath,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      creator.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(creator.title),
                  ],
                ),
              ),
              IconButton(
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  controller.isFavourite[index] =
                      !controller.isFavourite[index];
                  prefs.setBool('${creator.id}fav', controller.isFavourite[index]);
                },
                icon: Obx(() {
                  return Icon(
                    Icons.favorite,
                    color: controller.isFavourite[index]
                        ? Colors.red
                        : Colors.grey,
                  );
                }),
              )
            ],
          ),
        ],
      ),
    );
  }
}
