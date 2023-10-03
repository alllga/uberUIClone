import 'package:flutter/material.dart';
import 'package:uber_ui/classes/custom_text.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget(
          text: 'Your Activities',
          fSize: 25,
          fWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomTextWidget(
            text: 'Your Rides History',
            fSize: 18,
            fWeight: FontWeight.w400,
          ),
          Divider(
            color: Colors.black26,
            thickness: 2,
          ),
          SizedBox(height: 10),
          CustomRideHistoryWidget(
              dateAndTime: '18 Dec 2021, 6:04 PM',
              ridePrice: '\$80',
              pickUpLocation: '3039 Rose Avenue',
              destinationLocation: '1406 Romines Mill Road'),
          CustomRideHistoryWidget(
              dateAndTime: '7 January 2022, 5:056 PM',
              ridePrice: '\$45',
              pickUpLocation: '3822 Koontz Lane',
              destinationLocation: '1882 Watson Lane'),
          CustomRideHistoryWidget(
              dateAndTime: '26 May 2023, 10:25 PM',
              ridePrice: '\$101',
              pickUpLocation: '1874 Heather Sees Way',
              destinationLocation: '3089 Timber Oak Drive'),
        ]),
      ),
    );
  }
}

class CustomRideHistoryWidget extends StatelessWidget {
  final String dateAndTime;
  final String ridePrice;
  final String pickUpLocation;
  final String destinationLocation;
  const CustomRideHistoryWidget({
    super.key,
    required this.dateAndTime,
    required this.ridePrice,
    required this.pickUpLocation,
    required this.destinationLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextWidget(
              text: dateAndTime,
              fSize: 16,
              fWeight: FontWeight.w500,
            ),
            CustomTextWidget(
              text: ridePrice,
              fSize: 16,
              fWeight: FontWeight.w800,
            )
          ],
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            const Icon(
              Icons.pin_drop_outlined,
              size: 30,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  text: pickUpLocation,
                  fSize: 14,
                  textColor: Colors.grey,
                ),
                CustomTextWidget(
                  text: destinationLocation,
                  fSize: 14,
                  textColor: Colors.grey,
                )
              ],
            )
          ],
        ),
        const Divider(
          color: Colors.grey,
          thickness: 1,
        ),
      ],
    );
  }
}
