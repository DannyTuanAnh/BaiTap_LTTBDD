# Hướng dẫn sử dụng ứng dụng

## Chạy ứng dụng

1. Mở terminal trong thư mục dự án
2. Chạy lệnh:

```bash
flutter pub get
flutter run
```

## Luồng sử dụng

### Màn hình 1: Forget Password

- Nhập email (ví dụ: `user@example.com`)
- Nhấn "Next"
- ✅ Dữ liệu được lưu: `email`

### Màn hình 2: Verification

- Nhập 4 số verification code (ví dụ: `1234`)
- Nhấn "Next"
- ✅ Dữ liệu được lưu: `email` + `verificationCode`

### Màn hình 3: Reset Password

- Nhập mật khẩu mới (ví dụ: `123456`)
- Nhập lại mật khẩu (ví dụ: `123456`)
- Nhấn "Next"
- ✅ Dữ liệu được lưu: `email` + `verificationCode` + `password`

### Màn hình 4: Confirmation

- Xem lại tất cả thông tin đã nhập
- Nhấn "Submit"
- ✅ Tất cả dữ liệu được gửi đi

### Màn hình 5: Result

- Hiển thị kết quả thành công
- Xem tất cả thông tin đã nhập
- Nhấn "View Full Details" để xem chi tiết
- Nhấn "Back to Login" để quay về màn hình đầu

## Validation Rules

### Email

- Không được để trống
- Phải đúng format email (có @, domain)

### Verification Code

- Không được để trống
- Phải có ít nhất 4 ký tự

### Password

- Không được để trống
- Phải có ít nhất 6 ký tự
- Confirm password phải trùng với password

## Tính năng

✅ Mỗi lần nhập xong 1 trường và bấm Next → Dữ liệu được lưu  
✅ Dữ liệu được truyền qua các màn hình (Data Flow)  
✅ Validation realtime khi nhập  
✅ Hiển thị error message rõ ràng  
✅ UI đẹp, modern  
✅ Có thể back về màn hình trước  
✅ Loading state khi submit

## Cấu trúc code

### Models

- `user_data.dart`: Chứa tất cả dữ liệu người dùng

### Services

- `validation_service.dart`: Xử lý validation cho từng trường

### Screens

- `base_screen.dart`: Base class cho tất cả screens
- `forget_password_screen.dart`: Màn hình nhập email
- `verification_screen.dart`: Màn hình nhập mã xác thực
- `reset_password_screen.dart`: Màn hình đặt lại mật khẩu
- `confirmation_screen.dart`: Màn hình xác nhận
- `result_screen.dart`: Màn hình kết quả

### Widgets (Tái sử dụng)

- `custom_button.dart`: Button tùy chỉnh
- `custom_text_field.dart`: Text input tùy chỉnh
- `uth_logo.dart`: Logo UTH

### Utils

- `app_colors.dart`: Màu sắc
- `app_text_styles.dart`: Text styles

## Test Cases

### Test 1: Happy Path

1. Nhập email hợp lệ: `test@gmail.com`
2. Nhập code: `1234`
3. Nhập password: `123456`
4. Confirm password: `123456`
5. Submit
   ✅ **Expected**: Hiển thị màn hình kết quả với tất cả thông tin

### Test 2: Invalid Email

1. Nhập email không hợp lệ: `test`
2. Nhấn Next
   ✅ **Expected**: Hiển thị lỗi "Email không hợp lệ"

### Test 3: Password Mismatch

1. Nhập email: `test@gmail.com`
2. Nhập code: `1234`
3. Nhập password: `123456`
4. Confirm password: `654321` (khác)
5. Nhấn Next
   ✅ **Expected**: Hiển thị lỗi "Mật khẩu xác nhận không khớp"

### Test 4: Empty Fields

1. Để trống bất kỳ trường nào
2. Nhấn Next
   ✅ **Expected**: Hiển thị lỗi tương ứng

## Mở rộng

### Thêm màn hình mới

1. Tạo file trong `lib/screens/`
2. Extend `BaseScreen`
3. Override `getTitle()`, `getDescription()`, `buildBody()`

### Thêm validation mới

1. Mở `lib/services/validation_service.dart`
2. Thêm method vào interface
3. Implement trong `DefaultValidationService`

### Thêm widget mới

1. Tạo file trong `lib/widgets/`
2. Tạo StatelessWidget
3. Tái sử dụng trong các screens

## Debug

### Xem dữ liệu đang được lưu

- Thêm `print(userData.toString())` trong các màn hình
- Hoặc nhấn "View Full Details" ở màn hình Result

### Xem validation errors

- Check console khi validation fail
- Error message hiển thị dưới text field
