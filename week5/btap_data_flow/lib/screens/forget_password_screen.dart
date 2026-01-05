import 'package:flutter/material.dart';
import '../models/user_data.dart';
import '../services/validation_service.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import 'base_screen.dart';
import 'verification_screen.dart';

/// Màn hình Forget Password - Screen 1
/// Kế thừa từ BaseScreen (Inheritance)
class ForgetPasswordScreen extends BaseScreen {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends BaseScreenState<ForgetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final ValidationService _validationService = DefaultValidationService();
  String? _errorText;
  bool _isLoading = false;

  @override
  String getTitle() => 'Forget Password?';

  @override
  String getDescription() =>
      'Enter your Email, we will send you a verification code.';

  @override
  bool get showBackButton => false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _handleNext() {
    setState(() {
      _isLoading = true;
      _errorText = null;
    });

    // Simulate API call
    Future.delayed(const Duration(milliseconds: 500), () {
      if (!mounted) return;

      final email = _emailController.text.trim();

      if (_validationService.validateEmail(email)) {
        // Tạo UserData object và lưu email
        final userData = UserData(email: email);

        // Navigate to verification screen và truyền data
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerificationScreen(userData: userData),
          ),
        );
      } else {
        setState(() {
          _errorText = _validationService.getErrorMessage();
        });
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
          hintText: 'Your Email',
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          prefixIcon: Icons.email_outlined,
          errorText: _errorText,
          onChanged: (value) {
            if (_errorText != null) {
              setState(() {
                _errorText = null;
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
