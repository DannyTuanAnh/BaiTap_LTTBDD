import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String err = "";
  String success = "";
  TextEditingController emailController = TextEditingController();

  void _checkEmail(String email) {
    setState(() {
      err = "";
      success = "";

      if (email.isEmpty) {
        err = "Email không hợp lệ";
      } else if (!email.contains('@')) {
        err = "Email không đúng định dạng";
      } else {
        success = "Bạn đã nhập email hợp lệ";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            SizedBox(height: 350),
            Center(child: Text('Thực hành 02', style: TextStyle(fontSize: 20))),
            SizedBox(height: 20),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              child: Center(
                child: Text(
                  err.isNotEmpty ? err : success,
                  style: TextStyle(
                    color: err.isNotEmpty ? Colors.red : Colors.green,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _checkEmail(emailController.text),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                child: Text(
                  'Kiểm tra',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
