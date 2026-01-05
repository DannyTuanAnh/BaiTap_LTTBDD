import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Class chứa các text styles của ứng dụng
class AppTextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.text,
  );

  static const TextStyle body = TextStyle(fontSize: 14, color: AppColors.text);

  static const TextStyle bodyLight = TextStyle(
    fontSize: 14,
    color: AppColors.textLight,
  );

  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const TextStyle hint = TextStyle(
    fontSize: 14,
    color: AppColors.textLight,
  );
}
