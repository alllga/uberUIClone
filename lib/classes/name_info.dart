import 'package:flutter/material.dart';
import 'package:uber_ui/classes/app_assets.dart';

class NameInfo extends StatefulWidget {
  const NameInfo({super.key});

  @override
  State<NameInfo> createState() => _NameInfoState();
}

class _NameInfoState extends State<NameInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppAssets.textColor),
            ),
            SizedBox(height: 15),
            Text(
              'This is the name you would like other people to use when refering to you',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w200,
                  color: AppAssets.textColor),
            ),
            CustomTextField(nameType: 'First Name'),
            CustomTextField(nameType: 'Last Name'),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  final String nameType;
  const CustomTextField({
    super.key,
    required this.nameType,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.nameType),
          GestureDetector(
            onTap: () {
              setState(() {
                isTapped = !isTapped;
                print(isTapped);
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: isTapped ? Colors.white : Colors.grey[200],
                border: Border.all(
                    color: isTapped ? Colors.black : Colors.transparent),
              ),
              child: const Row(
                children: [
                  SizedBox(width: 10.0),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
