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
  TextEditingController controller1 = TextEditingController();

  TextEditingController controller2 = TextEditingController();

  double? result;

  void _handleCaculate(String operator) {
    try {
      double num1 = double.parse(controller1.text);
      double num2 = double.parse(controller2.text);

      setState(() {
        switch (operator) {
          case '+':
            result = num1 + num2;
            print(result);
            break;
          case '-':
            result = num1 - num2;
            break;
          case '*':
            result = num1 * num2;
            break;
          case '/':
            if (num2 == 0) {
              result = null;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Không thể chia cho 0')));
              return;
            }
            result = num1 / num2;
            break;
          default:
            throw Exception('Phép toán không hợp lệ');
        }
      });
    } catch (e) {
      setState(() {
        result = null;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Lỗi: Vui lòng nhập số hợp lệ')));
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 160),
            Center(
              child: Text(
                'Thực hành 03',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 80),
            TextField(
              controller: controller1,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: 'Nhập giá trị',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                CardOperator(operator: '+', color: Colors.red),
                SizedBox(width: 20),
                CardOperator(operator: '-', color: Colors.amber),
                SizedBox(width: 20),
                CardOperator(operator: '*', color: Colors.purple),
                SizedBox(width: 20),
                CardOperator(operator: '/', color: Colors.black),
              ],
            ),
            SizedBox(height: 20),
            TextField(
              controller: controller2,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: 'Nhập giá trị',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                result != null ? 'Kết quả: $result' : 'Kết quả: ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded CardOperator({required String operator, required Color color}) {
    return Expanded(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(color),
        ),
        onPressed: () => _handleCaculate(operator),
        child: Text(
          operator,
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
      ),
    );
  }
}
