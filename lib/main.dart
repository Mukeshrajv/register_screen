import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_screen/screens/loginPage.dart';
import 'package:register_screen/screens/registerPage.dart';

void main() {
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: LoginPage(),
    );
  }
}