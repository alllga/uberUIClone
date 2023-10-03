import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_ui/classes/app_assets.dart';
import 'package:uber_ui/classes/chat_screen.dart';
import 'package:uber_ui/classes/custom_button.dart';
import 'package:uber_ui/classes/custom_text.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  void _openBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const TripSelectionBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: Image.asset(
              'assets/images/google_map.png',
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: CustomButton(
                  buttonText: 'Choose a Trip',
                  onTap: _openBottomSheet,
                )),
          ),
        ],
      ),
    );
  }
}

class TripSelectionBottomSheet extends StatefulWidget {
  const TripSelectionBottomSheet({super.key});

  @override
  _TripSelectionBottomSheetState createState() =>
      _TripSelectionBottomSheetState();
}

class _TripSelectionBottomSheetState extends State<TripSelectionBottomSheet> {
  int selectedTileIndex = -1;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Container(
        color: const Color(0xFFFFFFFF),
        height: Get.height * 0.6,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Choose a Trip',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Divider(
              color: Colors.black26,
              height: 25,
              thickness: 1,
              indent: 5,
              endIndent: 5,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: selectedTileIndex == index ? 5 : 0,
                    shape: selectedTileIndex == index
                        ? RoundedRectangleBorder(
                            side: const BorderSide(color: AppAssets.textColor),
                            borderRadius: BorderRadius.circular(8.0),
                          )
                        : null,
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          selectedTileIndex = index;
                        });
                      },
                      leading: const Icon(Icons.car_rental_outlined),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(text: 'Uber Go $index'),
                          CustomTextWidget(
                              text: '8:46 pm - $index minutes away.')
                        ],
                      ),
                      trailing: const CustomTextWidget(
                        text: '\$300',
                        fSize: 15,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              buttonText: 'Choose Uber Go',
              onTap: () {
                Get.to(const ChatScreen());
              },
            )
          ],
        ),
      ),
    );
  }
}
