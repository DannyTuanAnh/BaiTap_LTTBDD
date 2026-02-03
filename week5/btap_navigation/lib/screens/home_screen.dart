import 'package:flutter/material.dart';
import 'settings_screen.dart';
import '../views/task_list_view.dart';
import '../widgets/calendar_tab.dart';
import '../views/add_task_view.dart';
import '../widgets/document_tab.dart';

/// Main Screen - Màn hình chính với Bottom Navigation Bar
/// MVVM: Sử dụng TaskListView thay vì HomeTab
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // Các màn hình cho từng tab
  late final List<Widget> _screens;

  // Method để chuyển về tab Home từ bên ngoài
  void navigateToHome() {
    if (mounted) {
      setState(() {
        _currentIndex = 0;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _screens = [
      const TaskListView(), // MVVM Architecture
      const CalendarTab(),
      AddTaskView(
        onTaskAdded: navigateToHome, // Truyền callback để navigate về Home
      ),
      const DocumentsTab(),
      const SettingsScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          selectedIconTheme: const IconThemeData(size: 35),
          unselectedItemColor: Colors.grey,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle, opticalSize: 40),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.description),
              label: 'Documents',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
