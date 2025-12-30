import 'package:flutter/material.dart';

class SizedBoxDemo extends StatelessWidget {
  const SizedBoxDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SizedBox Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Widget trên SizedBox'),
            SizedBox(height: 20), // Adds vertical space
            Container(
              color: Colors.deepPurple,
              width: 200,
              height: 50,
              child: Center(
                child: Text('Sized Box', style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 20), // Adds vertical space
            Text('Widget dưới SizedBox'),
          ],
        ),
      ),
    );
  }
}
