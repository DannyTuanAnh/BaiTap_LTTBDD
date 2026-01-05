import 'package:flutter/material.dart';

/// Model Class - OOP
/// Chứa dữ liệu cho mỗi trang onboarding
class OnboardingData {
  final String title;
  final String description;
  final IconData icon;

  OnboardingData({
    required this.title,
    required this.description,
    required this.icon,
  });

  /// Danh sách các trang onboarding mặc định
  static List<OnboardingData> getPages() {
    return [
      OnboardingData(
        title: 'Easy Time Management',
        description:
            'With management based on priority and daily tasks, it will give you convenience in managing and determining the tasks that must be done first',
        icon: Icons.calendar_month,
      ),
      OnboardingData(
        title: 'Increase Work Effectiveness',
        description:
            'Time management and the determination of more important tasks will give your job statistics much neat and always improve',
        icon: Icons.trending_up,
      ),
      OnboardingData(
        title: 'Reminder Notification',
        description:
            'The advantage of this application is that it also provides reminders for you so you can\'t forget to keep doing your assignments according to the time you have set',
        icon: Icons.notifications_active,
      ),
    ];
  }
}
