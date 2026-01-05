import 'package:flutter/material.dart';
import '../models/user_data.dart';
import '../services/validation_service.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import 'base_screen.dart';
import 'confirmation_screen.dart';

/// Màn hình Reset Password - Screen 3
/// Kế thừa từ BaseScreen (Inheritance)
class ResetPasswordScreen extends BaseScreen {
  final UserData userData;

  const ResetPasswordScreen({super.key, required this.userData});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends BaseScreenState<ResetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final ValidationService _validationService = DefaultValidationService();
  String? _passwordError;
  String? _confirmPasswordError;
  bool _isLoading = false;
  final bool _obscurePassword = true;
  final bool _obscureConfirmPassword = true;

  @override
  String getTitle() => 'Create new password';

  @override
  String getDescription() =>
      'Your new password must be different form previously used password';

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleNext() {
    setState(() {
      _isLoading = true;
      _passwordError = null;
      _confirmPasswordError = null;
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      if (!mounted) return;

      final password = _passwordController.text;
      final confirmPassword = _confirmPasswordController.text;

      bool isValid = true;

      if (!_validationService.validatePassword(password)) {
        setState(() {
          _passwordError = _validationService.getErrorMessage();
        });
        isValid = false;
      }

      if (!_validationService.validateConfirmPassword(
        password,
        confirmPassword,
      )) {
        setState(() {
          _confirmPasswordError = _validationService.getErrorMessage();
        });
        isValid = false;
      }

      if (isValid) {
        // Lưu password vào UserData
        widget.userData.password = password;
        widget.userData.confirmPassword = confirmPassword;

        // Navigate to confirmation screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ConfirmationScreen(userData: widget.userData),
          ),
        );
      }

      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          hintText: 'Password',
          controller: _passwordController,
          obscureText: _obscurePassword,
          prefixIcon: Icons.lock_outline,
          errorText: _passwordError,
          onChanged: (value) {
            if (_passwordError != null) {
              setState(() {
                _passwordError = null;
              });
            }
          },
        ),
        const SizedBox(height: 16),
        CustomTextField(
          hintText: 'Confirm Password',
          controller: _confirmPasswordController,
          obscureText: _obscureConfirmPassword,
          prefixIcon: Icons.lock_outline,
          errorText: _confirmPasswordError,
          onChanged: (value) {
            if (_confirmPasswordError != null) {
              setState(() {
                _confirmPasswordError = null;
              });
            }
          },
        ),
        const SizedBox(height: 24),
        CustomButton(
          text: 'Next',
          onPressed: _handleNext,
          isLoading: _isLoading,
        ),
      ],
    );
  }
}
