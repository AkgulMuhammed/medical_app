import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_medical_app/views/main_page.dart';
import 'package:flutter_medical_app/views/onboarding_screen.dart';



void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent),
  );
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: OnBoardingScreen(),
  ));
}
