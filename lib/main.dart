import 'package:first_project/Screens/Verification.dart';
import 'package:first_project/Screens/homePage.dart';
import 'package:first_project/Screens/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Screens/splashscreen.dart';

void main() async {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const Splashscreen(),
        '/login': (context) => const Loginscreen(),
        '/verification': (contex) => const verification(),
        '/HomePage': (contex) => const HomePage(),
      },
    ),
  );
}
