import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/task_model.dart';

/// Service để gọi API tasks
/// Áp dụng OOP và Singleton pattern
class TaskApiService {
  // Singleton instance
  static final TaskApiService _instance = TaskApiService._internal();
  factory TaskApiService() => _instance;
  TaskApiService._internal();

  static const String baseUrl = 'https://amock.io/api/researchUTH';

  /// Lấy danh sách tất cả tasks
  Future<List<TaskModel>> getTasks() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/tasks'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        if (jsonData['isSuccess'] == true) {
          final List<dynamic> tasksJson = jsonData['data'] as List<dynamic>;
          return tasksJson
              .map((json) => TaskModel.fromJson(json as Map<String, dynamic>))
              .toList();
        } else {
          throw Exception(jsonData['message'] ?? 'Failed to load tasks');
        }
      } else {
        throw Exception('Failed to load tasks: ${response.statusCode}');
      }
    } catch (e) {
      print('Error getting tasks: $e');
      rethrow;
    }
  }

  /// Lấy chi tiết một task theo ID
  Future<TaskModel> getTaskById(int taskId) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/task/$taskId'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        if (jsonData['isSuccess'] == true) {
          return TaskModel.fromJson(jsonData['data'] as Map<String, dynamic>);
        } else {
          throw Exception(jsonData['message'] ?? 'Failed to load task');
        }
      } else {
        throw Exception('Failed to load task: ${response.statusCode}');
      }
    } catch (e) {
      print('Error getting task $taskId: $e');
      rethrow;
    }
  }

  /// Xóa một task theo ID
  Future<bool> deleteTask(int taskId) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/task/$taskId'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return jsonData['isSuccess'] == true;
      } else {
        throw Exception('Failed to delete task: ${response.statusCode}');
      }
    } catch (e) {
      print('Error deleting task $taskId: $e');
      rethrow;
    }
  }
}
