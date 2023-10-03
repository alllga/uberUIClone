import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:uber_ui/Utils/utils.dart';
import 'package:uber_ui/classes/custom_button.dart';
import 'package:uber_ui/classes/custom_text.dart';

class RateUser extends StatefulWidget {
  const RateUser({super.key});

  @override
  State<RateUser> createState() => _RateUserState();
}

class _RateUserState extends State<RateUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget(
          text: 'Rating',
          fSize: 16,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/user.png'),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              const CustomTextWidget(
                text: 'How was your last ride?',
                fSize: 20,
                fWeight: FontWeight.w500,
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              RatingBar.builder(
                itemSize: 25,
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.black,
                ),
                onRatingUpdate: (rating) {
                  log(rating);
                },
              ),
              SizedBox(
                height: Get.height * 0.2,
              ),
              CustomButton(
                buttonText: 'Submit',
                onTap: () {
                  Utils().toastMessage('Review submitted successfully.');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
