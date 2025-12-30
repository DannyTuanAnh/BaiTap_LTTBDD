import 'package:flutter/material.dart';

class FloatingActionButtonDemo extends StatelessWidget {
  const FloatingActionButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Floating Action Button Demo')),
      body: const Center(child: Text('Welcome to Floating Action Button Demo')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Floating Action đang được nhấn')),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
