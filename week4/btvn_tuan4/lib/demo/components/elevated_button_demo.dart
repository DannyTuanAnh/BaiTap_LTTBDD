import 'package:flutter/material.dart';

class ElevatedButtonDemo extends StatelessWidget {
  const ElevatedButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Elevated Button Demo')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: const Text(
                  'Elevated Button khác biệt với Text Button ở chỗ nó có độ nổi cao hơn, thường được sử dụng để nhấn mạnh các hành động chính trong giao diện người dùng.',
                ),
              ),
            );
          },
          child: const Text('Elevated Button'),
        ),
      ),
    );
  }
}
