import 'package:flutter/material.dart';
import 'package:uber_ui/classes/custom_text.dart';

class ReUsableProfileTabs extends StatelessWidget {
  final String imagePath;
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  const ReUsableProfileTabs(
      {super.key,
      required this.text,
      required this.imagePath,
      required this.onTap,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 10),
            CustomTextWidget(
              text: text,
              fSize: 16,
              fWeight: FontWeight.w500,
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black)
          ],
        ),
      ),
    );
  }
}
