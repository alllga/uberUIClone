import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_ui/classes/custom_text.dart';
import 'package:uber_ui/classes/name_info.dart';
import 'package:uber_ui/classes/phone_info.dart';

class AccountInfo extends StatelessWidget {
  const AccountInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomTextWidget(
                text: 'Account info',
                fSize: 26,
                fWeight: FontWeight.w700,
              ),
              const SizedBox(height: 10),
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/user.png'),
              ),
              const SizedBox(height: 10),
              const CustomTextWidget(
                text: 'Basic info',
                fSize: 20,
                fWeight: FontWeight.w500,
              ),
              ReUsableAccountInfoWidget(
                infoType: 'Name',
                infoValue: 'John Smith',
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NameInfo(),
                    )),
              ),
              ReUsableAccountInfoWidget(
                infoType: 'Phone Number',
                infoValue: '+123456789',
                onTap: () {
                  Get.to(() => const PhoneInfo());
                },
              ),
              ReUsableAccountInfoWidget(
                infoType: 'Email',
                infoValue: 'john@gmail.com',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReUsableAccountInfoWidget extends StatelessWidget {
  final String infoType;
  final String infoValue;
  final VoidCallback onTap;
  const ReUsableAccountInfoWidget({
    Key? key,
    required this.infoType,
    required this.infoValue,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              text: infoType,
              fSize: 20,
              fWeight: FontWeight.w300,
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: infoValue,
                        hintStyle: const TextStyle(color: Colors.black87),
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(color: Colors.black87),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
