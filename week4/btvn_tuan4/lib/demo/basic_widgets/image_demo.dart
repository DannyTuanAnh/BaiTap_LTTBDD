import 'package:flutter/material.dart';

// Detail screen implementation
class ImageDemo extends StatelessWidget {
  const ImageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.network(
              'https://media.giphy.com/media/ICOgUNjpvO0PC/giphy.gif',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 10),
            Text('Image from Network', style: TextStyle(fontSize: 18)),
            SizedBox(height: 30),
            Image.asset('assets/uth.jpg', width: 200, height: 200),
            SizedBox(height: 10),
            Text('Image from Assets', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
