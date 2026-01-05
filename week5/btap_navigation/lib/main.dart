import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

/// Entry point của ứng dụng UTH SmartTasks
/// Ứng dụng quản lý task với onboarding flow
void main() {
  runApp(const MyApp());
}

/// Root widget của ứng dụng
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UTH SmartTasks',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
