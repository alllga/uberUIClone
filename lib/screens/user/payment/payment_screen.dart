import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_ui/classes/custom_button.dart';
import 'package:uber_ui/classes/custom_text.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController monthController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController cvcController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget(
          text: 'Payment',
          fSize: 16,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const CustomTextWidget(
              text: 'Card Number',
              fSize: 16,
              fWeight: FontWeight.bold,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: cardNumberController,
              keyboardType: TextInputType.number,
              maxLength: 19,
              decoration: const InputDecoration(
                counterText: '',
                hintText: '4242 4242 4242 4242',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black), // Set the desired border color
                ),
              ),
              onChanged: (value) {
                value = value.replaceAll(
                    ' ', ''); // Remove all spaces from the value
                if (value.isNotEmpty) {
                  String formattedValue = '';
                  for (int i = 0; i < value.length; i++) {
                    formattedValue += value[i];
                    if ((i + 1) % 4 == 0 && i != value.length - 1) {
                      formattedValue += ' ';
                    }
                  }
                  cardNumberController.value = TextEditingValue(
                    text: formattedValue,
                    selection:
                        TextSelection.collapsed(offset: formattedValue.length),
                  );
                } else {
                  cardNumberController.clear();
                }
              },
            ),
            const SizedBox(height: 16),
            const CustomTextWidget(
              text: 'Expiration Date',
              fSize: 16,
              fWeight: FontWeight.bold,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    maxLength: 2,
                    controller: monthController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'MM',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                Colors.black), // Set the desired border color
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    maxLength: 4,
                    controller: yearController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'YY',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                Colors.black), // Set the desired border color
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const CustomTextWidget(
              text: 'CVC',
              fSize: 16,
              fWeight: FontWeight.bold,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: cvcController,
              keyboardType: TextInputType.number,
              maxLength: 3,
              decoration: const InputDecoration(
                hintText: '123',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black), // Set the desired border color
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.2),
            CustomButton(
              buttonText: 'Pay',
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
