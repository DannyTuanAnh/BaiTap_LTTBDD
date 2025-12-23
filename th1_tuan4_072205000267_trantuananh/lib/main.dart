import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String title = 'Hello';
  String? name;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  "My First App",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Center(child: Text(title, style: TextStyle(fontSize: 20))),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 100,
              width: double.infinity,
              child: Center(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      title = title == 'Hello' ? "I'm Tran Tuan Anh" : 'Hello';
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  child: Text("Say Hi!", style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
