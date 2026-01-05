import 'package:flutter/material.dart';
import '../models/user_data.dart';
import '../widgets/custom_button.dart';
import 'base_screen.dart';
import 'result_screen.dart';

/// Màn hình Confirmation - Screen 4
/// Kế thừa từ BaseScreen (Inheritance)
class ConfirmationScreen extends BaseScreen {
  final UserData userData;

  const ConfirmationScreen({super.key, required this.userData});

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends BaseScreenState<ConfirmationScreen> {
  bool _isLoading = false;

  @override
  String getTitle() => 'Confirm';

  @override
  String getDescription() => 'We are here to help you!';

  void _handleSubmit() {
    setState(() {
      _isLoading = true;
    });

    // Simulate API call
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;

      // Navigate to result screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(userData: widget.userData),
        ),
      );
    });
  }

  Widget _buildInfoRow(
    IconData icon,
    String label,
    String value, {
    bool isPassword = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF00A6FF), size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                const SizedBox(height: 4),
                Text(
                  isPassword ? '•' * value.length : value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF333333),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        _buildInfoRow(
          Icons.email_outlined,
          'Email',
          widget.userData.email ?? '',
        ),
        _buildInfoRow(
          Icons.verified_user_outlined,
          'Verification Code',
          widget.userData.verificationCode ?? '',
        ),
        _buildInfoRow(
          Icons.lock_outline,
          'Password',
          widget.userData.password ?? '',
          isPassword: true,
        ),
        const SizedBox(height: 8),
        CustomButton(
          text: 'Submit',
          onPressed: _handleSubmit,
          isLoading: _isLoading,
        ),
      ],
    );
  }
}
