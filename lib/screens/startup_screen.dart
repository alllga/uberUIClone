import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_ui/classes/custom_button.dart';
import 'package:uber_ui/screens/user/auth/login_screen.dart';

class StartUpScreen extends StatelessWidget {
  const StartUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text("Uber"),
            ),
            CustomButton(
              buttonText: 'Login As User',
              onTap: () {
                Get.to(const LoginScreen());
              },
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
