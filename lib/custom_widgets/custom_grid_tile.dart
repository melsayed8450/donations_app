import 'package:donation_app/models/creator_object.dart';
import 'package:donation_app/screens/donate_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/home_page_get.dart';

class CustomGridTile extends StatelessWidget {
  CustomGridTile({
    super.key,
    required this.creator,
  });

  final homePageGet = Get.put(HomePageGet());

  final Creator creator;
  @override
  Widget build(BuildContext context) {
    final screen_height = MediaQuery.of(context).size.height;
    final screen_width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screen_width / 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton(
            onPressed: ()async {
              await Get.to(()=>DonatePage(creator: creator,));
            },
            child: Container(
              height: screen_height / 6.5,
              width: screen_width / 2,
              child: Image.asset(
                creator.image_path,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black,
                    creator.color,
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screen_width * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      creator.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(creator.title),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                 
                },
                icon: Icon(Icons.favorite_border_outlined),
              )
            ],
          ),
        ],
      ),
    );
  }
}
