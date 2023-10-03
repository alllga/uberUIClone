import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  //final String _autoReplyMessage = '';

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 15, right: 15),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const ChatMessage(isSender: false, text: 'I am on my way'),
            const SizedBox(height: 20),
            const ChatMessage(isSender: true, text: 'Where are you?'),
            SizedBox(height: Get.height * 0.40),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoReplyChip(
                    text: 'Where are you?',
                    onPressed: () {
                      setState(() {
                        _messageController.text = 'Where are you?';
                      });
                    },
                  ),
                  AutoReplyChip(
                    text:
                        'How much time do you take to reach the pickup location',
                    onPressed: () {
                      setState(() {
                        _messageController.text =
                            'How much time do you take to reach the pickup location';
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Type your message...',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {});
                  },
                  icon: const Icon(Icons.send),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final bool isSender;
  final String text;

  const ChatMessage({required this.isSender, required this.text, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSender ? Colors.blue : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: TextStyle(color: isSender ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}

class AutoReplyChip extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AutoReplyChip({required this.text, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ActionChip(
        label: Text(text),
        onPressed: onPressed,
      ),
    );
  }
}
