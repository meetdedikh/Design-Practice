import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Message',
            style: TextStyle(
              fontFamily: 'Billabong',
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        body: const Center(
          child: Text('Message Screen'),
        ));
  }
}
