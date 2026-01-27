import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../models/user_model.dart';
import 'firestore_service.dart';

/// Service class để xử lý authentication với Firebase
/// Áp dụng OOP và Singleton pattern
class AuthService {
  // Singleton instance
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  // Firebase và Google Sign In instances
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirestoreService _firestoreService = FirestoreService();

  /// Lấy user hiện tại
  User? get currentUser => _auth.currentUser;

  /// Stream để lắng nghe trạng thái authentication
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// Đăng nhập bằng Google
  /// Returns: User nếu thành công, null nếu thất bại
  Future<User?> signInWithGoogle() async {
    try {
      // Trigger Google Sign In flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // User đã hủy đăng nhập
        return null;
      }

      // Lấy authentication details từ request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Tạo credential mới
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Đăng nhập vào Firebase với credential
      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );

      final user = userCredential.user;
      if (user != null) {
        // Lưu hoặc cập nhật thông tin user vào Firestore
        // Nếu Firestore lỗi, vẫn cho phép đăng nhập thành công
        try {
          final userModel = UserModel(
            uid: user.uid,
            email: user.email ?? '',
            displayName: user.displayName ?? 'User',
            photoURL: user.photoURL,
            createdAt: DateTime.now(),
            lastLoginAt: DateTime.now(),
          );

          await _firestoreService.createOrUpdateUser(userModel);
          print('User saved to Firestore successfully');
        } catch (firestoreError) {
          print('Warning: Could not save to Firestore: $firestoreError');
          print('User can still login, but data is not persisted');
          // Không throw error, vẫn cho phép đăng nhập
        }
      }

      return user;
    } catch (e) {
      print('Error signing in with Google: $e');
      return null;
    }
  }

  /// Đăng xuất
  Future<void> signOut() async {
    try {
      await Future.wait([_auth.signOut(), _googleSignIn.signOut()]);
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  /// Lấy thông tin user hiện tại
  Map<String, String?> getUserInfo() {
    final user = currentUser;
    if (user == null) {
      return {'displayName': null, 'email': null, 'photoURL': null};
    }

    return {
      'displayName': user.displayName,
      'email': user.email,
      'photoURL': user.photoURL,
    };
  }
}
