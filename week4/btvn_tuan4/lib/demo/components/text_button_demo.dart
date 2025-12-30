import 'package:flutter/material.dart';

class TextButtonDemo extends StatelessWidget {
  const TextButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text Button Demo')),
      body: Center(
        child: TextButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Text Button Pressed')),
            );
          },
          child: const Text('Click Here'),
        ),
      ),
    );
  }
}
