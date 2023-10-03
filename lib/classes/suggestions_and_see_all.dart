import 'package:flutter/material.dart';
import 'package:uber_ui/classes/custom_text.dart';

class SuggestionsAndSeeAll extends StatelessWidget {
  const SuggestionsAndSeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextWidget(
            text: 'Suggestions',
            fWeight: FontWeight.bold,
            fSize: 18,
          ),

          // Text(
          //   'See All',
          //   style: TextStyle(
          //     fontWeight: FontWeight.w300,
          //     fontSize: 14,
          //   ),
          // ),
        ],
      ),
    );
  }
}
