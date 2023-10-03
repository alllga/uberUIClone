import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_ui/classes/account_info.dart';
import 'package:uber_ui/classes/custom_button.dart';
import 'package:uber_ui/classes/custom_text.dart';
import 'package:uber_ui/classes/rate_user.dart';
import 'package:uber_ui/classes/reusable_account_tabs.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            UserInformation(
              username: 'John Smith',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AccountInfo(),
                    ));
              },
            ),
            const SizedBox(height: 20),
            CustomButton(buttonText: 'Wallet', onTap: () {}),
            const SizedBox(height: 20),
            ReUsableProfileTabs(
                text: 'Settings',
                imagePath: '',
                onTap: () {},
                icon: Icons.settings),
            ReUsableProfileTabs(
              text: 'Messages',
              imagePath: '',
              onTap: () {},
              icon: Icons.message,
            ),
            ReUsableProfileTabs(
              text: 'Manage Kwike Account',
              imagePath: '',
              onTap: () {},
              icon: Icons.person,
            ),
            ReUsableProfileTabs(
                text: 'Review',
                imagePath: '',
                icon: Icons.reviews,
                onTap: () {
                  Get.to(const RateUser());
                }),
            ReUsableProfileTabs(
              text: 'Legal',
              imagePath: '',
              onTap: () {},
              icon: Icons.assistant_direction,
            ),
          ],
        ),
      ),
    );
  }
}

class UserInformation extends StatelessWidget {
  final String username;
  final VoidCallback onTap;
  const UserInformation({
    super.key,
    required this.username,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              text: username,
              fSize: 30,
              fWeight: FontWeight.w700,
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
            )
          ],
        ),
        GestureDetector(
          onTap: onTap,
          child: const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/images/user.png'),
          ),
        )
      ],
    );
  }
}
