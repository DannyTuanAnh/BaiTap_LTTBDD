import 'package:flutter/material.dart';

// Detail screen implementation
class TextDemo extends StatelessWidget {
  const TextDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Hello'),

              SizedBox(height: 10),
              Text('Text center', textAlign: TextAlign.center),
              SizedBox(height: 10),
              Text(
                'Đây là 1 đoạn văn bản dài để minh họa việc cắt bớt văn bản khi nó vượt quá giới hạn hiển thị của widget Text trong Flutter.',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  text: 'I agree with ',
                  children: [
                    TextSpan(
                      text: 'Terms & Conditions',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  text: 'The ',
                  style: TextStyle(fontSize: 22),
                  children: [
                    TextSpan(
                      text: 'quick',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(text: ' '),
                    TextSpan(
                      text: 'Brown ',
                      style: TextStyle(
                        color: Colors.brown,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    TextSpan(
                      text: 'over ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'the',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                    TextSpan(
                      text: ' lazy',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    TextSpan(text: ' dog.'),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
