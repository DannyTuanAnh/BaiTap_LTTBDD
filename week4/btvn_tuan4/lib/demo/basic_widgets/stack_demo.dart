import 'package:flutter/material.dart';

class StackDemo extends StatelessWidget {
  const StackDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Stack cơ bản (chồng lên nhau)'),
                SizedBox(height: 16),
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.grey[300],
                  child: Stack(
                    children: [
                      Container(width: 150, height: 150, color: Colors.blue),
                      Container(width: 100, height: 100, color: Colors.red),
                      Container(width: 50, height: 50, color: Colors.green),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                Text('Stack với Positioned'),
                SizedBox(height: 16),
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.grey[300],
                  child: Stack(
                    children: [
                      Container(width: 150, height: 150, color: Colors.blue),
                      Positioned(
                        top: 20,
                        left: 20,
                        child: Container(
                          width: 100,
                          height: 100,
                          color: Colors.red,
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Container(
                          width: 50,
                          height: 50,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                Text('Stack với alignment'),
                SizedBox(height: 16),
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.grey[300],
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(width: 150, height: 150, color: Colors.blue),
                      Container(width: 100, height: 100, color: Colors.red),
                      Container(width: 50, height: 50, color: Colors.green),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
