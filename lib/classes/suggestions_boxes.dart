// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:uber_ui/classes/custom_text.dart';
import 'package:uber_ui/screens/user/services/booking_rides.dart';

class SuggestionBoxes extends StatelessWidget {
  const SuggestionBoxes({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleSuggestionBox(
              onTap: () => Get.to(const RideBookingScreen(),
                  transition: Transition.downToUp),
              imagePath: 'assets/images/car.svg',
              suggestionBoxText: 'Ride'),
          SingleSuggestionBox(
              onTap: () {},
              imagePath: 'assets/images/package.svg',
              suggestionBoxText: 'Package'),
          SingleSuggestionBox(
              onTap: () {},
              imagePath: 'assets/images/reserve.svg',
              suggestionBoxText: 'Reserve'),
        ],
      ),
    );
  }
}

class SingleSuggestionBox extends StatelessWidget {
  final String imagePath;
  final String suggestionBoxText;
  final VoidCallback onTap;

  const SingleSuggestionBox({
    Key? key,
    required this.imagePath,
    required this.suggestionBoxText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            height: 55,
            width: 60,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color:
                  Colors.grey[100], // Change to your desired background color
              borderRadius: BorderRadius.circular(8),
            ),
            child: SvgPicture.asset(
              imagePath,
              height: 32,
              width: 32,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          CustomTextWidget(text: suggestionBoxText)
        ],
      ),
    );
  }
}
