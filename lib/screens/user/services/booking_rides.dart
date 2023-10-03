// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:uber_ui/classes/app_assets.dart';
import 'package:uber_ui/classes/custom_button.dart';
import 'package:uber_ui/classes/custom_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ride Booking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RideBookingScreen(),
    );
  }
}

class RideBookingScreen extends StatefulWidget {
  const RideBookingScreen({super.key});

  @override
  _RideBookingScreenState createState() => _RideBookingScreenState();
}

class _RideBookingScreenState extends State<RideBookingScreen> {
  DateTime selectedDate = DateTime.now();
  List<String> availableTimes = [
    '9:00 AM',
    '11:00 AM',
    '2:00 PM',
    '3:00 PM',
    '4:00 PM',
    '6:00 PM',
    '8:00 PM',
    '9:30:00 PM',
    '11:00 PM',
    '12:00 AM',
    '1:00 AM',
    // Add more available times...
  ];

  String? selectedTime;

  void updateAvailableTimes() {
    // Implement logic to fetch available times based on the selectedDate
    // For simplicity, we'll assume availableTimes remains the same for all dates
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget(text: 'Schedule Ride'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextWidget(
                text: 'Select Date', fSize: 20, fWeight: FontWeight.bold),
            const SizedBox(height: 8),
            SizedBox(
              height: 100,
              child: DatePicker(
                DateTime.now(),
                initialSelectedDate: selectedDate,
                selectionColor: Colors.black,
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                  setState(() {
                    selectedDate = date;
                    updateAvailableTimes();
                  });
                },
              ),
            ),
            const SizedBox(height: 16),
            const CustomTextWidget(
                text: 'Available Times', fSize: 20, fWeight: FontWeight.w500),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: availableTimes.map((time) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: SizedBox(
                      width: 120,
                      height: 40,
                      child: ChoiceChip(
                        backgroundColor: AppAssets.backgroundColor,
                        label: Text(
                          time,
                          style: const TextStyle(color: Colors.black),
                        ),
                        selectedColor: Colors.black38,
                        selected: selectedTime == time,
                        onSelected: (selected) {
                          setState(() {
                            selectedTime = selected ? time : null;
                          });
                        },
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 24),
            CustomButton(
              buttonText: 'Book Ride',
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
