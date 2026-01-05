/// Service để xử lý validation
/// Thể hiện tính Abstraction (trừu tượng hóa logic)
abstract class ValidationService {
  bool validateEmail(String email);
  bool validateVerificationCode(String code);
  bool validatePassword(String password);
  bool validateConfirmPassword(String password, String confirmPassword);
  String? getErrorMessage();
}

/// Implementation cụ thể của ValidationService
/// Thể hiện tính Inheritance và Polymorphism
class DefaultValidationService implements ValidationService {
  String? _errorMessage;

  @override
  String? getErrorMessage() => _errorMessage;

  @override
  bool validateEmail(String email) {
    if (email.isEmpty) {
      _errorMessage = 'Email không được để trống';
      return false;
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      _errorMessage = 'Email không hợp lệ';
      return false;
    }

    _errorMessage = null;
    return true;
  }

  @override
  bool validateVerificationCode(String code) {
    if (code.isEmpty) {
      _errorMessage = 'Mã xác thực không được để trống';
      return false;
    }

    if (code.length < 4) {
      _errorMessage = 'Mã xác thực phải có ít nhất 4 ký tự';
      return false;
    }

    _errorMessage = null;
    return true;
  }

  @override
  bool validatePassword(String password) {
    if (password.isEmpty) {
      _errorMessage = 'Mật khẩu không được để trống';
      return false;
    }

    if (password.length < 6) {
      _errorMessage = 'Mật khẩu phải có ít nhất 6 ký tự';
      return false;
    }

    _errorMessage = null;
    return true;
  }

  @override
  bool validateConfirmPassword(String password, String confirmPassword) {
    if (confirmPassword.isEmpty) {
      _errorMessage = 'Xác nhận mật khẩu không được để trống';
      return false;
    }

    if (password != confirmPassword) {
      _errorMessage = 'Mật khẩu xác nhận không khớp';
      return false;
    }

    _errorMessage = null;
    return true;
  }
}
