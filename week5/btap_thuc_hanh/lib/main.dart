import 'package:btap_thuc_hanh/colum.dart';
import 'package:btap_thuc_hanh/lazy_column.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Flutter App')),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 6,
                horizontal: 10,
              ), // Giãn cách giữa các thẻ
              decoration: BoxDecoration(
                color: const Color.fromARGB(122, 65, 149, 218),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                title: Text(
                  'Column 1,000,000 items',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  // điều hướng qua file colum.dart
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ColumnDemo()),
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 6,
                horizontal: 10,
              ), // Giãn cách giữa các thẻ
              decoration: BoxDecoration(
                color: const Color.fromARGB(122, 65, 149, 218),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                title: Text(
                  'LazyColumn 1,000,000 items',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  // điều hướng qua file lazy_column.dart
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LazyListDemo(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
