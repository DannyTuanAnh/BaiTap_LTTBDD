import 'package:flutter/material.dart';

class LazyListDemo extends StatelessWidget {
  const LazyListDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lazy ListView Demo')),
      body: ListView.builder(
        itemCount: 1000000, // 1000000 dữ liệu
        itemBuilder: (context, index) {
          return ListTile(title: Text('Item #$index'));
        },
      ),
    );
  }
}
