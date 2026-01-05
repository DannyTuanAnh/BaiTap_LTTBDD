import 'package:flutter/material.dart';
import '../models/user_data.dart';
import '../utils/app_colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/uth_logo.dart';
import 'forget_password_screen.dart';

/// Màn hình Result - Hiển thị kết quả cuối cùng
class ResultScreen extends StatelessWidget {
  final UserData userData;

  const ResultScreen({super.key, required this.userData});

  Widget _buildResultItem(
    String label,
    String value, {
    bool isPassword = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: Text(
              isPassword ? '•' * value.length : value,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.text,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

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
                const SizedBox(height: 40),

                // Logo
                const UthLogo(size: 100),

                const SizedBox(height: 20),

                // App name
                const Text(
                  'SmartTasks',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),

                const SizedBox(height: 40),

                // Success icon
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: AppColors.success.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check_circle_outline,
                    color: AppColors.success,
                    size: 50,
                  ),
                ),

                const SizedBox(height: 24),

                // Title
                const Text(
                  'Password Reset Successfully!',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.text,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 12),

                // Description
                Text(
                  'Your account information has been saved',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: AppColors.textLight),
                ),

                const SizedBox(height: 40),

                // User data display
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Account Information',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.text,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildResultItem('Email', userData.email ?? 'N/A'),
                      _buildResultItem(
                        'Verification Code',
                        userData.verificationCode ?? 'N/A',
                      ),
                      _buildResultItem(
                        'Password',
                        userData.password ?? 'N/A',
                        isPassword: true,
                      ),
                      _buildResultItem(
                        'Confirm Password',
                        userData.confirmPassword ?? 'N/A',
                        isPassword: true,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                // Action buttons
                CustomButton(
                  text: 'Back to Login',
                  onPressed: () {
                    // Navigate back to first screen and clear all previous screens
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const ForgetPasswordScreen(),
                      ),
                      (route) => false,
                    );
                  },
                ),

                const SizedBox(height: 16),

                TextButton(
                  onPressed: () {
                    // Show dialog with full data
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Complete Data'),
                        content: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Email: ${userData.email}'),
                              const SizedBox(height: 8),
                              Text(
                                'Verification Code: ${userData.verificationCode}',
                              ),
                              const SizedBox(height: 8),
                              Text('Password: ${userData.password}'),
                              const SizedBox(height: 8),
                              Text(
                                'Confirm Password: ${userData.confirmPassword}',
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Close'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text(
                    'View Full Details',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
