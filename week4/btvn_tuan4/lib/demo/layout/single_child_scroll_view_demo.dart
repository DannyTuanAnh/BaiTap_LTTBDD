import 'package:flutter/material.dart';

class SimpleChildScrollViewDemo extends StatelessWidget {
  const SimpleChildScrollViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SingleChildScrollView Demo')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            20,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                alignment: Alignment.center,
                height: 50,
                color: Colors.green,
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Đây là thẻ ${index + 1}',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
