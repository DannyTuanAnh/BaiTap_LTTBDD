import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

/// Service class để làm việc với Firestore Database
/// Áp dụng OOP và Singleton pattern
class FirestoreService {
  // Singleton instance
  static final FirestoreService _instance = FirestoreService._internal();
  factory FirestoreService() => _instance;
  FirestoreService._internal();

  // Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Collection references
  CollectionReference get _usersCollection => _firestore.collection('users');

  /// Tạo hoặc cập nhật thông tin user trong Firestore
  Future<void> createOrUpdateUser(UserModel user) async {
    try {
      print('🔥 Starting to save user to Firestore...');
      print('🔥 User UID: ${user.uid}');
      print('🔥 User email: ${user.email}');
      print('🔥 User data: ${user.toMap()}');

      await _usersCollection
          .doc(user.uid)
          .set(
            user.toMap(),
            SetOptions(merge: true), // Merge để không ghi đè toàn bộ
          );

      print('✅ User saved to Firestore successfully: ${user.uid}');
    } catch (e, stackTrace) {
      print('❌ Error saving user to Firestore: $e');
      print('❌ Stack trace: $stackTrace');
      rethrow;
    }
  }

  /// Lấy thông tin user từ Firestore
  Future<UserModel?> getUser(String uid) async {
    try {
      final doc = await _usersCollection.doc(uid).get();
      if (doc.exists) {
        return UserModel.fromMap(doc.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      print('Error getting user from Firestore: $e');
      return null;
    }
  }

  /// Stream để lắng nghe thay đổi thông tin user
  Stream<UserModel?> userStream(String uid) {
    return _usersCollection.doc(uid).snapshots().map((doc) {
      if (doc.exists) {
        return UserModel.fromMap(doc.data() as Map<String, dynamic>);
      }
      return null;
    });
  }

  /// Cập nhật thời gian đăng nhập cuối
  Future<void> updateLastLogin(String uid) async {
    try {
      await _usersCollection.doc(uid).update({'lastLoginAt': Timestamp.now()});
    } catch (e) {
      print('Error updating last login: $e');
    }
  }

  /// Xóa user từ Firestore
  Future<void> deleteUser(String uid) async {
    try {
      await _usersCollection.doc(uid).delete();
      print('User deleted from Firestore: $uid');
    } catch (e) {
      print('Error deleting user from Firestore: $e');
      rethrow;
    }
  }

  /// Lấy tất cả users (dùng cho admin)
  Future<List<UserModel>> getAllUsers() async {
    try {
      final snapshot = await _usersCollection.get();
      return snapshot.docs
          .map((doc) => UserModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error getting all users: $e');
      return [];
    }
  }
}
