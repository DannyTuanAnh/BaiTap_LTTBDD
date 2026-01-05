# Data Flow Navigation - Week 5

## Mô tả dự án

Ứng dụng Flutter demo về Data Flow Navigation với quy trình "Forget Password" bao gồm 4 màn hình:

1. **Forget Password Screen** - Nhập email
2. **Verification Screen** - Nhập mã xác thực (4 số)
3. **Reset Password Screen** - Nhập mật khẩu mới
4. **Confirmation Screen** - Xác nhận thông tin
5. **Result Screen** - Hiển thị kết quả cuối cùng

## Cấu trúc dự án (Clean Architecture)

```
lib/
├── models/              # Data models
│   └── user_data.dart   # Model chứa dữ liệu người dùng
├── services/            # Business logic
│   └── validation_service.dart  # Service xử lý validation
├── screens/             # UI screens
│   ├── base_screen.dart           # Base class cho tất cả screens
│   ├── forget_password_screen.dart
│   ├── verification_screen.dart
│   ├── reset_password_screen.dart
│   ├── confirmation_screen.dart
│   └── result_screen.dart
├── widgets/             # Reusable widgets
│   ├── custom_button.dart
│   ├── custom_text_field.dart
│   └── uth_logo.dart
├── utils/               # Utilities & constants
│   ├── app_colors.dart
│   └── app_text_styles.dart
└── main.dart            # Entry point
```

## 4 Tính chất OOP được áp dụng

### 1. **Encapsulation (Đóng gói)**

- **UserData Model** (`models/user_data.dart`): Đóng gói tất cả dữ liệu người dùng (email, verification code, password) vào một class duy nhất với các phương thức truy xuất an toàn.
- **ValidationService** (`services/validation_service.dart`): Đóng gói logic validation riêng biệt, không để lộ chi tiết implementation.

### 2. **Abstraction (Trừu tượng hóa)**

- **ValidationService Interface**: Định nghĩa abstract class với các phương thức validation, che giấu chi tiết implementation cụ thể.
- **BaseScreen và BaseScreenState**: Trừu tượng hóa cấu trúc chung của tất cả các màn hình, các screen con chỉ cần implement các phương thức abstract.

### 3. **Inheritance (Kế thừa)**

- **Screen Classes**: Tất cả các screen (`ForgetPasswordScreen`, `VerificationScreen`, etc.) kế thừa từ `BaseScreen`.
- **State Classes**: Tất cả các state kế thừa từ `BaseScreenState<T>`, tái sử dụng code chung (logo, title, description, back button).
- **ValidationService**: `DefaultValidationService` kế thừa từ `ValidationService` abstract class.

### 4. **Polymorphism (Đa hình)**

- **buildBody()**: Mỗi screen override phương thức `buildBody()` với implementation riêng.
- **getTitle() và getDescription()**: Mỗi screen override để trả về nội dung khác nhau.
- **ValidationService**: Có thể dễ dàng thay thế bằng implementation khác (ví dụ: `ServerValidationService`) mà không thay đổi code sử dụng.

## Data Flow

1. **ForgetPasswordScreen**: Nhập email → Lưu vào `UserData.email` → Navigate
2. **VerificationScreen**: Nhận `UserData`, nhập code → Lưu vào `UserData.verificationCode` → Navigate
3. **ResetPasswordScreen**: Nhận `UserData`, nhập password → Lưu vào `UserData.password` → Navigate
4. **ConfirmationScreen**: Nhận `UserData`, hiển thị tất cả thông tin → Submit
5. **ResultScreen**: Hiển thị kết quả cuối cùng với tất cả dữ liệu đã nhập

## Cách chạy

```bash
# Cài đặt dependencies
flutter pub get

# Chạy ứng dụng
flutter run
```

## Tính năng

✅ Data flow navigation giữa các màn hình  
✅ Validation cho từng trường nhập liệu  
✅ Lưu trữ dữ liệu qua các màn hình  
✅ UI đẹp, modern, theo chuẩn Material Design  
✅ Clean Architecture - dễ maintain và mở rộng  
✅ Reusable components (CustomButton, CustomTextField)  
✅ Áp dụng đầy đủ 4 tính chất OOP

## Công nghệ sử dụng

- Flutter SDK
- Dart
- Material Design

## Tác giả

BaiTap_LTTBDD - Week 5
