# Hướng dẫn cấu hình Firebase cho Google Sign In

## Các bước cần thực hiện:

### 1. Tạo Firebase Project

1. Truy cập https://console.firebase.google.com/
2. Tạo project mới hoặc chọn project có sẵn
3. Thêm ứng dụng Android vào project

### 2. Cấu hình Android App

#### a. Lấy SHA-1 fingerprint (quan trọng cho Google Sign In):

```bash
cd android
./gradlew signingReport
```

Hoặc trên Windows:

```bash
cd android
gradlew.bat signingReport
```

Copy SHA-1 từ kết quả (có dạng: `SHA-1: XX:XX:XX:...`)

#### b. Trong Firebase Console:

1. Vào Project Settings > Your apps > Android app
2. Thêm SHA-1 fingerprint vào mục "SHA certificate fingerprints"
3. Download file `google-services.json`
4. Copy file này vào thư mục `android/app/`

### 3. Cập nhật file build.gradle

#### android/build.gradle.kts (Project level):

Thêm Google services plugin:

```kotlin
buildscript {
    dependencies {
        classpath("com.google.gms:google-services:4.4.0")
    }
}
```

#### android/app/build.gradle.kts (App level):

Thêm plugin vào cuối file:

```kotlin
plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services") // Thêm dòng này
}
```

### 4. Enable Google Sign-In trong Firebase Console

1. Vào Firebase Console > Authentication
2. Click "Get Started"
3. Chọn "Sign-in method" tab
4. Enable "Google" provider
5. Nhập support email
6. Save

### 5. Enable Cloud Firestore (Database)

1. Vào Firebase Console > Firestore Database
2. Click "Create database"
3. Chọn "Start in test mode" (để test, sau đó sẽ thay đổi rules)
4. Chọn location (ví dụ: asia-southeast1 cho Việt Nam)
5. Click "Enable"

#### Firestore Security Rules (Test mode - CHỈ DÙNG ĐỂ TEST):

```
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if request.time < timestamp.date(2026, 3, 1);
    }
  }
}
```

#### Firestore Security Rules (Production - AN TOÀN HƠN):

```
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Users collection - chỉ user được đọc/ghi dữ liệu của chính mình
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
  }
}
```

### 6. Cài đặt dependencies

```bash
flutter pub get
```

### 7. Chạy ứng dụng

```bash
flutter run
```

## Lưu ý quan trọng:

1. **SHA-1 fingerprint**: Bắt buộc phải có để Google Sign In hoạt động
2. **google-services.json**: File này chứa cấu hình Firebase, không được commit lên git
3. **Package name**: Phải trùng với applicationId trong build.gradle
4. **Internet permission**: Đã được thêm mặc định trong AndroidManifest.xml

## Troubleshooting:

### Lỗi: "PlatformException(sign_in_failed)"

- Kiểm tra lại SHA-1 fingerprint đã được thêm vào Firebase Console
- Đảm bảo file google-services.json nằm đúng vị trí
- Clean và rebuild project: `flutter clean && flutter pub get`

### Lỗi: "API not enabled"

- Vào Google Cloud Console
- Enable "Google+ API" hoặc "Google People API"

### Lỗi build Android:

```bash
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get
flutter run
```

## Testing:

1. Chạy app trên thiết bị thật hoặc emulator
2. Click nút "SIGN IN WITH GOOGLE"
3. Chọn tài khoản Google
4. Kiểm tra thông tin user hiển thị trên Home Screen
5. Test nút đăng xuất
