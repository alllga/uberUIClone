import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_ui/classes/app_assets.dart';
import 'package:uber_ui/classes/custom_button.dart';
import 'package:uber_ui/classes/custom_text.dart';
import 'package:uber_ui/classes/custom_text_field.dart';
import 'package:uber_ui/screens/user/auth/login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppAssets.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppAssets.backgroundColor,
        leading: IconButton(
          icon: const Padding(
            padding: EdgeInsets.all(25.0),
            child: Icon(
              Icons.arrow_back_ios,
              color: AppAssets.textColor,
            ),
          ), // Set the desired icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // Other AppBar properties...
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTextWidget(
                      text: 'Register',
                      fSize: 25,
                    ),
                    const SizedBox(height: 40),
                    CustomTextField(
                        controller: phoneController,
                        name: 'Phone Number',
                        hintText: 'Enter your Phone Number',
                        keyboardType: TextInputType.number),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      controller: passwordController,
                      name: 'Password',
                      hintText: 'Enter your Password',
                      obsecureText: true,
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      controller: confirmPasswordController,
                      name: 'Confirm Password',
                      hintText: 'Enter your Password',
                      obsecureText: true,
                      keyboardType: TextInputType.text,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              CustomButton(
                buttonText: 'Register',
                onTap: () {
                  if (_formKey.currentState!.validate()) {}
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomTextWidget(
                    text: 'Already have a Account?',
                    textColor: Colors.black,
                    fSize: 12,
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(const LoginScreen());
                      },
                      child: const CustomTextWidget(
                        text: 'Login',
                        fSize: 12,
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
