import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:piquirigg/core/shared/utils/colors_model.dart';
import 'package:piquirigg/ui/home/home_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // darkTheme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}
