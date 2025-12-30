import 'package:flutter/material.dart';

class ExpandedDemo extends StatelessWidget {
  const ExpandedDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expanded Demo')),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Color(0xFFEF6C00),
              child: Center(
                child: Text(
                  'Expanded chiếm 1 phần',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.deepPurple,
              child: Center(
                child: Text(
                  'Expanded chiếm 2 phần',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
          Container(
            height: 100,
            color: Colors.red,
            child: Center(
              child: Text(
                'Container cố định 100px',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
