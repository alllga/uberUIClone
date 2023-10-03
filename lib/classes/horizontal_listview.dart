// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uber_ui/classes/custom_text.dart';

class HorizontalListView extends StatelessWidget {
  const HorizontalListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextWidget(
            text: 'Ways to save with Kwike',
            fSize: 20,
            fWeight: FontWeight.bold,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SingleBox(
                  imagePath: 'app_logo.PNG',
                  firstText: 'Weekly Discounts',
                  secondText: 'Get Exciting discounts weekly.',
                ),
                SingleBox(
                  imagePath: 'app_logo.PNG',
                  firstText: 'Monthly Discounts',
                  secondText: 'Get Exciting discounts monthly.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SingleBox extends StatelessWidget {
  final String imagePath;
  final String firstText;
  final String secondText;
  const SingleBox({
    Key? key,
    required this.imagePath,
    required this.firstText,
    required this.secondText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          // decoration: const BoxDecoration(
          //     image: DecorationImage(
          //         image: AssetImage('assets/images/food_delivery.jpeg'))),
          width: 240,
          height: 150,
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            margin: const EdgeInsets.all(10),
            child: Image.asset(
              'assets/images/$imagePath',
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomTextWidget(
                  text: firstText,
                  fSize: 16,
                  fWeight: FontWeight.w500,
                ),
                const SizedBox(width: 5),
                SvgPicture.asset('assets/images/icon-arrow-right.svg'),
              ],
            ),
            CustomTextWidget(
              text: secondText,
              fSize: 12,
              textColor: Colors.grey,
            ),
          ],
        )
      ],
    );
  }
}
