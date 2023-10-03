import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uber_ui/screens/startup_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Future<void> startUp() async {
  //   Future.delayed(const Duration(seconds: 3), () {
  //     Get.to(() => const HomeScreen());
  //   });
  // }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) => const StartUpScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: Image.asset('assets/images/app_logo.PNG')));
  }
}
