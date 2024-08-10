import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notepadx/routes/routes_names.dart';
import 'package:notepadx/routes/routes_pages.dart';
import 'package:notepadx/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backGroundColor,
      ),
      debugShowCheckedModeBanner: false,
      getPages: RoutePages.routes,
      initialRoute: RouteNames.homeScreen,
    );
  }
}
