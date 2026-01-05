# Giải thích chi tiết 4 Tính chất OOP trong dự án

## 1. Encapsulation (Đóng gói) 🔒

### Định nghĩa

Encapsulation là việc đóng gói dữ liệu và các phương thức xử lý dữ liệu vào trong một đơn vị duy nhất (class), và kiểm soát quyền truy cập vào dữ liệu đó.

### Ví dụ trong dự án

#### a) UserData Model (`lib/models/user_data.dart`)

```dart
class UserData {
  String? email;              // Dữ liệu được đóng gói
  String? verificationCode;
  String? password;
  String? confirmPassword;

  // Phương thức kiểm tra dữ liệu hợp lệ - logic được đóng gói
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
}
```

**Lợi ích**:

- Tất cả dữ liệu user được quản lý tập trung
- Logic validation được đóng gói trong model
- Dễ dàng bảo trì và mở rộng

#### b) ValidationService (`lib/services/validation_service.dart`)

```dart
class DefaultValidationService implements ValidationService {
  String? _errorMessage;  // Private variable - đóng gói

  @override
  bool validateEmail(String email) {
    // Logic validation được đóng gói
    if (email.isEmpty) {
      _errorMessage = 'Email không được để trống';
      return false;
    }
    // ... logic khác
  }
}
```

**Lợi ích**:

- Logic validation phức tạp được ẩn đi
- Chỉ expose các phương thức cần thiết
- Dễ dàng test và maintain

---

## 2. Abstraction (Trừu tượng hóa) 🎭

### Định nghĩa

Abstraction là việc ẩn đi các chi tiết implementation phức tạp và chỉ hiển thị các tính năng thiết yếu.

### Ví dụ trong dự án

#### a) ValidationService Interface (`lib/services/validation_service.dart`)

```dart
// Abstract class định nghĩa contract
abstract class ValidationService {
  bool validateEmail(String email);
  bool validateVerificationCode(String code);
  bool validatePassword(String password);
  bool validateConfirmPassword(String password, String confirmPassword);
  String? getErrorMessage();
}

// Implementation cụ thể
class DefaultValidationService implements ValidationService {
  // Chi tiết implementation được ẩn đi
  @override
  bool validateEmail(String email) {
    // Complex regex validation
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
}
```

**Lợi ích**:

- Người dùng không cần biết cách validation hoạt động
- Có thể thay đổi implementation mà không ảnh hưởng code khác
- Có thể có nhiều implementation khác nhau

#### b) BaseScreenState (`lib/screens/base_screen.dart`)

```dart
abstract class BaseScreenState<T extends BaseScreen> extends State<T> {
  // Abstract methods - các screen con phải implement
  Widget buildBody(BuildContext context);
  String getTitle();
  String getDescription();

  @override
  Widget build(BuildContext context) {
    // Implementation chung được ẩn đi, tự động tạo layout
    return Scaffold(
      body: Column(
        children: [
          // Logo, title, description tự động
          buildBody(context),  // Chỉ cần implement phần này
        ],
      ),
    );
  }
}
```

**Lợi ích**:

- Ẩn đi logic layout phức tạp
- Các screen chỉ cần implement business logic riêng
- Code ngắn gọn và dễ hiểu hơn

---

## 3. Inheritance (Kế thừa) 👨‍👦

### Định nghĩa

Inheritance cho phép một class kế thừa các thuộc tính và phương thức từ class khác.

### Ví dụ trong dự án

#### a) Screen Inheritance (`lib/screens/`)

```dart
// Base class
abstract class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});
}

// Child class kế thừa
class ForgetPasswordScreen extends BaseScreen {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

// State cũng kế thừa
class _ForgetPasswordScreenState extends BaseScreenState<ForgetPasswordScreen> {
  // Kế thừa toàn bộ layout từ BaseScreenState

  @override
  String getTitle() => 'Forget Password?';  // Override

  @override
  Widget buildBody(BuildContext context) {
    // Chỉ cần viết phần riêng
    return Column(
      children: [
        CustomTextField(...),
        CustomButton(...),
      ],
    );
  }
}
```

**Lợi ích**:

- Tái sử dụng code (logo, layout, back button)
- Giảm duplicate code
- Dễ dàng tạo screen mới

#### b) Service Inheritance

```dart
abstract class ValidationService {
  bool validateEmail(String email);
}

class DefaultValidationService implements ValidationService {
  // Implementation mặc định
}

// Có thể tạo implementation khác
class ServerValidationService implements ValidationService {
  // Validation qua server API
  @override
  bool validateEmail(String email) async {
    // Call API để validate
  }
}
```

---

## 4. Polymorphism (Đa hình) 🎪

### Định nghĩa

Polymorphism cho phép các object khác nhau có thể được xử lý thông qua cùng một interface, nhưng có behavior khác nhau.

### Ví dụ trong dự án

#### a) Method Overriding

```dart
// Mỗi screen override các method với content khác nhau

class _ForgetPasswordScreenState extends BaseScreenState<ForgetPasswordScreen> {
  @override
  String getTitle() => 'Forget Password?';

  @override
  Widget buildBody(BuildContext context) {
    return Column(children: [/* Email input */]);
  }
}

class _VerificationScreenState extends BaseScreenState<VerificationScreen> {
  @override
  String getTitle() => 'Verify Code';

  @override
  Widget buildBody(BuildContext context) {
    return Column(children: [/* 4 digit inputs */]);
  }
}
```

**Kết quả**: Cùng gọi `getTitle()` nhưng mỗi screen trả về khác nhau.

#### b) Interface Polymorphism

```dart
// Có thể dùng bất kỳ implementation nào của ValidationService
ValidationService validator1 = DefaultValidationService();
ValidationService validator2 = ServerValidationService();

// Cùng interface, khác implementation
bool isValid1 = validator1.validateEmail(email);  // Local validation
bool isValid2 = validator2.validateEmail(email);  // Server validation
```

#### c) Widget Polymorphism

```dart
// CustomButton có thể có nhiều styles khác nhau
CustomButton(
  text: 'Next',
  backgroundColor: AppColors.primary,  // Blue button
)

CustomButton(
  text: 'Submit',
  backgroundColor: AppColors.success,  // Green button
)
```

**Lợi ích**:

- Flexible và dễ mở rộng
- Có thể swap implementation dễ dàng
- Code dễ test và maintain

---

## Tổng kết

### So sánh các tính chất:

| Tính chất         | Mục đích                       | Ví dụ trong dự án                                |
| ----------------- | ------------------------------ | ------------------------------------------------ |
| **Encapsulation** | Bảo vệ dữ liệu, đóng gói logic | `UserData`, `ValidationService`                  |
| **Abstraction**   | Ẩn chi tiết phức tạp           | `ValidationService` interface, `BaseScreenState` |
| **Inheritance**   | Tái sử dụng code               | All screens extend `BaseScreen`                  |
| **Polymorphism**  | Linh hoạt, đa dạng hóa         | Override methods, Interface implementations      |

### Lợi ích khi kết hợp:

1. **Code ngắn gọn hơn**: Không duplicate code
2. **Dễ maintain**: Thay đổi một chỗ, áp dụng toàn bộ
3. **Dễ mở rộng**: Thêm screen mới rất nhanh
4. **Dễ test**: Mỗi component độc lập
5. **Clean Architecture**: Tách biệt rõ ràng giữa UI, Business Logic, và Data
