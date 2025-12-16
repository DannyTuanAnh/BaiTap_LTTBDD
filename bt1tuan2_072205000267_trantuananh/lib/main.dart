import 'package:flutter/material.dart';

import 'widget/card_body_widget.dart';

void main() {
  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<int> numbers = [];
  String errorMessage = '';

  void _createList(int id) {
    numbers.clear();
    for (int i = 1; i <= id; i++) {
      numbers.add(i);
    }
  }

  TextEditingController controller = TextEditingController();

  void _handleOnclick() {
    try {
      setState(() => numbers.clear());
      int value = int.parse(controller.text);
      if (value <= 0) {
        setState(() => errorMessage = 'Vui lòng nhập số lớn hơn 0');
        return;
      }
      setState(() {
        _createList(value);
        errorMessage = '';
      });
    } catch (e) {
      setState(() => errorMessage = 'Dữ liệu bạn nhập không hợp lệ');
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 300),
              Center(
                child: Text(
                  "Thực hành 02",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        labelText: 'Nhập vào số lượng',
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () => _handleOnclick(),
                      child: Text(
                        'Tạo',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),
              if (errorMessage.isNotEmpty)
                Container(
                  child: Text(
                    errorMessage,
                    style: TextStyle(color: Colors.red, fontSize: 18),
                  ),
                ),
              ...numbers.map((num) => CardBody(value: num)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
