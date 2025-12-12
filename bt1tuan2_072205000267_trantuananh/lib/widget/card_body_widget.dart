import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  const CardBody({super.key, required this.value});

  final int value;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.red,
      ),
      margin: EdgeInsets.only(bottom: 20),
      alignment: Alignment.center,
      width: double.infinity,
      height: 50,
      child: Text(
        "$value",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
