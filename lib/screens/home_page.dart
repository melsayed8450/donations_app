import 'package:donation_app/custom_widgets/custom_grid_tile.dart';
import 'package:donation_app/models/home_page_get.dart';
import 'package:donation_app/screens/all_donations_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final homePageGet = Get.put(HomePageGet());
  @override
  Widget build(BuildContext context) {
    final screen_height = MediaQuery.of(context).size.height;
    final screen_width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  width: screen_width * 0.7,
                  height: screen_height * 0.1,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: TextButton(
                    child: Text(
                      'All Donations',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      homePageGet.onAllDonationsButtonPressed();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Row(
          children: [
            Icon(Icons.circle_notifications_outlined),
            SizedBox(
              width: screen_width * 0.02,
            ),
            Text('T I O B U'),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screen_width * 0.02),
            child: CircleAvatar(
              child: Icon(Icons.person_2),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Recommended Creators',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: screen_width * 0.05),
            ),
          ),
          Container(
            height: screen_height - screen_height / 5.4,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
              ),
              children: [
                for (int i = 0; i < homePageGet.creatorsList.length; i++)
                  CustomGridTile(creator: homePageGet.creatorsList[i]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
