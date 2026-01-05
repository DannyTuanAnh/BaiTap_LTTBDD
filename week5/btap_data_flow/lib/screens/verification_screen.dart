import 'package:flutter/material.dart';
import '../models/user_data.dart';
import '../services/validation_service.dart';
import '../widgets/custom_button.dart';
import 'base_screen.dart';
import 'reset_password_screen.dart';

/// Màn hình Verification - Screen 2
/// Kế thừa từ BaseScreen (Inheritance)
class VerificationScreen extends BaseScreen {
  final UserData userData;

  const VerificationScreen({super.key, required this.userData});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends BaseScreenState<VerificationScreen> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
  final ValidationService _validationService = DefaultValidationService();
  String? _errorText;
  bool _isLoading = false;

  @override
  String getTitle() => 'Verify Code';

  @override
  String getDescription() => 'we just sent you on your registered Email';

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  String _getCode() {
    return _controllers.map((c) => c.text).join();
  }

  void _handleNext() {
    setState(() {
      _isLoading = true;
      _errorText = null;
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      if (!mounted) return;

      final code = _getCode();

      if (_validationService.validateVerificationCode(code)) {
        // Lưu verification code vào UserData
        widget.userData.verificationCode = code;

        // Navigate to reset password screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ResetPasswordScreen(userData: widget.userData),
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

  Widget _buildCodeInput(int index) {
    return SizedBox(
      width: 60,
      height: 60,
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF00A6FF), width: 2),
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 3) {
            _focusNodes[index + 1].requestFocus();
          } else if (value.isEmpty && index > 0) {
            _focusNodes[index - 1].requestFocus();
          }

          if (_errorText != null) {
            setState(() {
              _errorText = null;
            });
          }
        },
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (index) => _buildCodeInput(index)),
        ),
        if (_errorText != null) ...[
          const SizedBox(height: 8),
          Text(
            _errorText!,
            style: const TextStyle(color: Colors.red, fontSize: 12),
          ),
        ],
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
