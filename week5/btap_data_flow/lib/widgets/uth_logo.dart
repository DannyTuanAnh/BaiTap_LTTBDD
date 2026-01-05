import 'package:flutter/material.dart';

/// Widget hiển thị logo UTH
class UthLogo extends StatelessWidget {
  final double size;

  const UthLogo({super.key, this.size = 120});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/uth.jpg',
      width: size,
      height: size,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.school, size: 40, color: Colors.grey),
              SizedBox(height: 8),
              Text(
                'UTH',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
