import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uber_ui/classes/custom_text.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.grey[200],
            ),
            child: Row(
              children: [
                SvgPicture.asset('assets/images/icon-search.svg'),
                const SizedBox(width: 10.0),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Where to?',
                      hintStyle: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.w300),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/images/icon-time.svg'),
                      const SizedBox(width: 6.0),
                      const CustomTextWidget(
                        text: 'Now',
                        fWeight: FontWeight.w300,
                      ),
                      const SizedBox(width: 6.0),
                      SvgPicture.asset('assets/images/icon-arrow.svg'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
