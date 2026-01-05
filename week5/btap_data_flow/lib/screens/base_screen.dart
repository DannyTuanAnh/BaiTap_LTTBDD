import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../widgets/uth_logo.dart';

/// Base screen abstract class - Thể hiện tính Abstraction và Inheritance
/// Các screen khác sẽ kế thừa từ class này
abstract class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});
}

/// Base state cho tất cả các screen
/// Thể hiện tính Inheritance và Polymorphism
abstract class BaseScreenState<T extends BaseScreen> extends State<T> {
  /// Phương thức abstract để các screen con implement
  Widget buildBody(BuildContext context);

  /// Tiêu đề của màn hình
  String getTitle();

  /// Mô tả của màn hình
  String getDescription();

  /// Có hiển thị nút back không
  bool get showBackButton => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                // Back button
                if (showBackButton)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back_ios),
                      color: AppColors.primary,
                    ),
                  ),

                const SizedBox(height: 20),

                // Logo
                const UthLogo(size: 100),

                const SizedBox(height: 20),

                // App name
                Text(
                  'SmartTasks',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),

                const SizedBox(height: 40),

                // Title
                Text(
                  getTitle(),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.text,
                  ),
                ),

                const SizedBox(height: 12),

                // Description
                Text(
                  getDescription(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: AppColors.textLight),
                ),

                const SizedBox(height: 40),

                // Body content
                buildBody(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
