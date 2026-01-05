/// Model class đại diện cho dữ liệu người dùng
/// Thể hiện tính Encapsulation (đóng gói dữ liệu)
class UserData {
  String? email;
  String? verificationCode;
  String? password;
  String? confirmPassword;

  UserData({
    this.email,
    this.verificationCode,
    this.password,
    this.confirmPassword,
  });

  /// Constructor copy để tạo bản sao
  UserData.copy(UserData other)
    : email = other.email,
      verificationCode = other.verificationCode,
      password = other.password,
      confirmPassword = other.confirmPassword;

  /// Phương thức kiểm tra dữ liệu có hợp lệ không
  bool isValid() {
    return email != null &&
        email!.isNotEmpty &&
        verificationCode != null &&
        verificationCode!.isNotEmpty &&
        password != null &&
        password!.isNotEmpty &&
        confirmPassword != null &&
        confirmPassword!.isNotEmpty &&
        password == confirmPassword;
  }

  /// Convert to Map
  Map<String, String?> toMap() {
    return {
      'email': email,
      'verificationCode': verificationCode,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }

  @override
  String toString() {
    return 'UserData{email: $email, verificationCode: $verificationCode, password: $password, confirmPassword: $confirmPassword}';
  }
}
