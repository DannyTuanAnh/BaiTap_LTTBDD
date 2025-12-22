import 'package:flutter/material.dart';
import '../controller/library_controller.dart';
import 'book_manage_screen.dart';
import 'user_manage_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  final controller = LibraryController();

  @override
  Widget build(BuildContext context) {
    final screens = [
      BookManagementScreen(controller: controller),
      UserManagementScreen(controller: controller),
    ];

    return Scaffold(
      body: screens[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Quản lý sách',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Người dùng',
          ),
        ],
      ),
    );
  }
}
