import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(top: 40, left: 20),
                child: boxMethod(45, 45, Alignment.center, Icons.arrow_back),
              ),
              Container(
                margin: EdgeInsets.only(top: 40, right: 20),
                child: boxMethod(45, 45, Alignment.center, Icons.edit),
              ),
            ],
          ),
          Center(
            child: SizedBox(
              width: 220,
              height: 274,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      boxMethod(
                        150,
                        150,
                        Alignment.center,
                        null,
                        true,
                        "assets/images/avatar.jpg",
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Trần Tuấn Anh",
                    style: TextStyle(
                      fontSize: 28,
                      color: Color(0xFF736E6E),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "UTH, Viet Nam",
                    style: TextStyle(
                      fontSize: 22,
                      color: Color(0xFF736E6E),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container boxMethod(
    double width,
    double height,
    Alignment direction, [
    IconData? icon,
    bool isCircle = false,
    String? imagePath,
  ]) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(isCircle ? width / 2 : 10),
        color: Color(0xFFEDEDED),
        border: !isCircle
            ? Border.all(color: Color(0xFFB5B4B4), width: 2)
            : null,
        image: imagePath != null
            ? DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover)
            : null,
      ),
      alignment: direction,
      width: width,
      height: height,
      child: imagePath == null && icon != null
          ? IconButton(icon: Icon(icon), onPressed: () {})
          : null,
    );
  }
}
