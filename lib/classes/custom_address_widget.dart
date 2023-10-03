import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uber_ui/classes/custom_text.dart';

class CustomAddressWidget extends StatelessWidget {
  const CustomAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/images/icon-time.svg',
            height: 25,
            width: 25,
          ),
          const SizedBox(
            width: 10,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(
                text: 'Select Citywalk Mall',
                fSize: 16,
                fWeight: FontWeight.w700,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: 'Saket district center,district center, sector 6, ',
                    fSize: 12,
                    textColor: Colors.grey,
                  ),
                  CustomTextWidget(
                    text: 'pushp vihar, New Delhi, Delhi 110017',
                    fSize: 12,
                    textColor: Colors.grey,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
