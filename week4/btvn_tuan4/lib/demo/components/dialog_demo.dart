import 'package:flutter/material.dart';

class DialogDemo extends StatelessWidget {
  const DialogDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dialog Demo')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Dialog'),
                content: const Text('Hello. This is a dialog demo.'),
              ),
            );
          },
          child: const Text('Dialog'),
        ),
      ),
    );
  }
}
