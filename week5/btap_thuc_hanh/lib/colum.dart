import 'package:flutter/material.dart';

class ColumnDemo extends StatelessWidget {
  const ColumnDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Column Demo')),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            1000000,
            (index) => ListTile(title: Text('Item #$index')),
          ),
        ),
      ),
    );
  }
}
