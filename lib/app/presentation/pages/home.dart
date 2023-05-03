import 'package:donation_app/app/presentation/widgets/custom_grid_tile.dart';
import 'package:donation_app/app/presentation/manager/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final controlller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    final screenHeight = context.height;
    final screenWidth = context.width;
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  width: screenWidth * 0.7,
                  height: screenHeight * 0.1,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: TextButton(
                    child: const Text(
                      'All Donations',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      controlller.onAllDonationsButtonPressed();
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
            const Icon(Icons.circle_notifications_outlined),
            SizedBox(
              width: screenWidth * 0.02,
            ),
            const Text('T I O B U'),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
            child: const CircleAvatar(
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
                  fontWeight: FontWeight.bold, fontSize: screenWidth * 0.05),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.82,
            child: GridView(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
              ),
              children: [
                for (int i = 0; i < controlller.creatorsList.length; i++)
                  CustomGridTile(
                    creator: controlller.creatorsList[i],
                    index: i,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
