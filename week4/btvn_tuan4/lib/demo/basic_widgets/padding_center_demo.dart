import 'package:flutter/material.dart';

class PaddingCenterDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Text('Padding Widget', textAlign: TextAlign.center),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                color: Colors.blue,
                child: Text(
                  'This container has padding of 20 on all sides',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('Center Widget', textAlign: TextAlign.center),
            Container(
              color: Colors.green,
              height: 100,
              child: Center(
                child: Text(
                  'This text is centered within the container',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
