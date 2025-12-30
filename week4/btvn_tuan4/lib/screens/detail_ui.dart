import 'package:flutter/material.dart';

// Detail screen implementation
class DetailUIScreen extends StatelessWidget {
  final String title;
  final Widget demo;

  DetailUIScreen({required this.title, required this.demo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(padding: const EdgeInsets.all(16.0), child: demo),
    );
  }
}
