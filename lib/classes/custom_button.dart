import 'package:flutter/material.dart';
import 'package:uber_ui/classes/custom_text.dart';

import 'app_assets.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  final Color color;
  final double height;
  final double width;
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.color = AppAssets.buttonColor,
    this.height = 48,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            backgroundColor: color,
          ),
          onPressed: onTap,
          child: CustomTextWidget(
            text: buttonText,
            textColor: Colors.white,
            fSize: 15,
          )),
    );
  }
}
