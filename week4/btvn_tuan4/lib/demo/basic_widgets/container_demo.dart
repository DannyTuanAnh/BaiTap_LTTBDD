import 'package:flutter/material.dart';

class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Text('Container cơ bản', textAlign: TextAlign.center),
            Center(
              child: Container(width: 100, height: 100, color: Colors.blue),
            ),
            SizedBox(height: 20),
            Text(
              'Container với padding và margin',
              textAlign: TextAlign.center,
            ),
            Center(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.green,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                child: Text(
                  'Padding & Margin',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('Decoration trong Container', textAlign: TextAlign.center),
            Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('Container với gradient', textAlign: TextAlign.center),
            Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple, Colors.pink],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('Container với boxShadow', textAlign: TextAlign.center),
            Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      offset: Offset(5, 5),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('Alignment trong Container', textAlign: TextAlign.center),
            Container(
              height: 100,
              color: Colors.amber,
              alignment: Alignment.center,
              child: Text('Center'),
            ),
          ],
        ),
      ),
    );
  }
}
