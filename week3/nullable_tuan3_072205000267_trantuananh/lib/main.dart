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
  String? name;
  //Gán giá trị để test
  @override
  Widget build(BuildContext context) {
    var length1 = name?.length;
    var length2 = name?.length ?? 0;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Text(
              "Các cách xử lý null phổ biến",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              "1. Sử dụng '?' chỉ là khai báo khả năng null, chưa xử lý gì cả. Vd kiểm tra name:",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              name != null
                  ? "name có giá trị là: $name"
                  : "name là null. \nString? name; // biến có thể null",
              style: TextStyle(fontSize: 14, color: Colors.blue),
            ),
            SizedBox(height: 20),
            Text(
              "2. Sử dụng '?.' Nếu name == null thì trả null không crash",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              length1 != null
                  ? "name có chiều dài là: $length1"
                  : "name là null. \nNếu sử dụng ?. mà name == null thì trả null không crash",
              style: TextStyle(fontSize: 14, color: Colors.blue),
            ),
            SizedBox(height: 20),
            Text(
              "3. Sử dụng '??' thay vì '?:' trong kotlin ",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              "name có chiều dài là: $length2 \nNếu bên trái dấu ?? null thì dùng giá trị mặc định.",
              style: TextStyle(fontSize: 14, color: Colors.blue),
            ),
            SizedBox(height: 20),
            Text(
              "4. Sử dụng kiểm tra null thay vì let trong kotlin (Flutter không có ?.let) ",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              name != null
                  ? "name có giá trị là: $name"
                  : "name là null. \nFlutter không có ?.let nên dùng if (name != null) thay thế.",
              style: TextStyle(fontSize: 14, color: Colors.blue),
            ),
            SizedBox(height: 20),
            Text(
              "5. Sử dụng '!' trong Flutter, còn Kotlin dùng '!!' để ép null thành non-null ",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              "Toán tử ! ép biến nullable thành non-null. Nếu giá trị thực sự là null thì sẽ lỗi runtime.",
              style: TextStyle(fontSize: 14, color: Colors.blue),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    try {
                      //Demo non-null
                      var length = name!.length;

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Độ dài name (dùng !): $length"),
                        ),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Lỗi runtime vì name == null nhưng vẫn dùng !",
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "Test '!' ",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    setState(() {
                      name = name == null ? "Anh Tran" : null;
                    });
                  },
                  child: Text(
                    "Nút đổi giá trị name",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
