import 'package:donation_app/app/presentation/routes/app_pages.dart';
import 'package:donation_app/app/presentation/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class DonationApp extends StatelessWidget {
  const DonationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
       theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 73, 4, 218),
      ),
      debugShowCheckedModeBanner: false,
      smartManagement: SmartManagement.keepFactory,
      defaultTransition: Transition.fadeIn,
      getPages: AppRoutes.routes,
      initialRoute: AppPages.home,
    );
  }
}

