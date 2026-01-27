import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';
import 'home_screen.dart';

/// Login Screen - Màn hình đăng nhập
/// Hiển thị sau khi hoàn thành onboarding
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _authService = AuthService();
  bool _isLoading = false;

  /// Logic xử lý đăng nhập với Google
  Future<void> _handleGoogleSignIn() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final User? user = await _authService.signInWithGoogle();

      if (!mounted) return;

      if (user != null) {
        // Đăng nhập thành công
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        // User đã hủy hoặc có lỗi
        _showErrorDialog('Đăng nhập thất bại. Vui lòng thử lại.');
      }
    } catch (e) {
      if (!mounted) return;
      _showErrorDialog('Có lỗi xảy ra: ${e.toString()}');
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  /// Hiển thị dialog lỗi
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Thông báo'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    const SizedBox(height: 60),
                    _buildLogoSection(),
                    const Spacer(),
                    _buildWelcomeSection(),
                    const SizedBox(height: 32),
                    _buildGoogleSignInButton(),
                    const Spacer(),
                    _buildFooter(),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
      ),
    );
  }

  /// Logo và tiêu đề ứng dụng
  Widget _buildLogoSection() {
    return Column(
      children: [
        // Logo UTH trong khung vuông với background xanh nhạt
        Container(
          width: 220,
          height: 220,
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Image.asset(
              'assets/logo/logo_uth.png',
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 24),
        // Tiêu đề SmartTasks
        const Text(
          'SmartTasks',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 8),
        // Subtitle
        Text(
          'A simple and efficient to-do app',
          style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
        ),
      ],
    );
  }

  /// Phần Welcome text
  Widget _buildWelcomeSection() {
    return Column(
      children: [
        const Text(
          'Welcome',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Ready to explore? Log in to get started.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
        ),
      ],
    );
  }

  /// Nút đăng nhập với Google
  Widget _buildGoogleSignInButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: _isLoading ? null : _handleGoogleSignIn,
        icon: Image.asset(
          'assets/logo/logo_google.png',
          width: 24,
          height: 24,
          errorBuilder: (context, error, stackTrace) {
            // Fallback nếu không có logo Google
            return const Icon(Icons.login, color: Colors.blue);
          },
        ),
        label: const Text(
          'SIGN IN WITH GOOGLE',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue.shade50,
          foregroundColor: Colors.black87,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 0,
        ),
      ),
    );
  }

  /// Footer với copyright
  Widget _buildFooter() {
    return Text(
      '© UTHSmartTasks',
      style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
    );
  }
}
