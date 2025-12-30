import 'package:flutter/material.dart';

class AppBarDemo extends StatelessWidget {
  const AppBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('App Bar (Thanh tiêu đề)')),
      body: const Center(child: Text('Đây là nội dung UI')),
    );
  }
}
