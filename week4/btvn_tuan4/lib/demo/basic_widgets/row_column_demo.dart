import 'package:flutter/material.dart';

class RowColumnDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Row Example:', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber),
                SizedBox(width: 8),
                Text('Star'),
                SizedBox(width: 8),
                Icon(Icons.favorite, color: Colors.red),
                SizedBox(width: 8),
                Text('Favorite'),
              ],
            ),
            Divider(height: 32),
            Text(
              'Column Example:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.home, color: Colors.blue),
                SizedBox(height: 8),
                Text('Home'),
                SizedBox(height: 8),
                Icon(Icons.settings, color: Colors.green),
                SizedBox(height: 8),
                Text('Settings'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
