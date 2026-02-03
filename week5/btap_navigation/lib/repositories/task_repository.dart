import '../models/task_model.dart';
import '../database/database_helper.dart';

/// Task Repository - Quản lý nguồn dữ liệu local
/// MVVM Pattern: Repository là trung gian giữa ViewModel và Database
class TaskRepository {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  /// Lấy tất cả tasks từ local database
  Future<List<TaskModel>> getTasksFromLocal({int? limit}) async {
    try {
      return await _dbHelper.getAllTasks(limit: limit);
    } catch (e) {
      print('Error getting tasks from local: $e');
      return [];
    }
  }

  /// Lấy task theo ID từ local
  Future<TaskModel?> getTaskByIdFromLocal(int id) async {
    try {
      return await _dbHelper.getTaskById(id);
    } catch (e) {
      print('Error getting task $id from local: $e');
      return null;
    }
  }

  /// Thêm task mới vào local database
  Future<int> addTask(TaskModel task) async {
    try {
      final taskId = await _dbHelper.insertTask(task);
      return taskId;
    } catch (e) {
      print('Repository ERROR adding task: $e');
      rethrow;
    }
  }

  /// Cập nhật task trong local database
  Future<bool> updateTask(TaskModel task) async {
    try {
      final result = await _dbHelper.updateTask(task);
      print('Updated task ID: ${task.id}');
      return result > 0;
    } catch (e) {
      print('Error updating task: $e');
      return false;
    }
  }

  /// Xóa task từ local database
  Future<bool> deleteTaskFromLocal(int id) async {
    try {
      final result = await _dbHelper.deleteTask(id);
      print('Deleted task ID: $id from local');
      return result > 0;
    } catch (e) {
      print('Error deleting task from local: $e');
      return false;
    }
  }

  /// Xóa tất cả tasks từ local
  Future<void> deleteAllTasks() async {
    try {
      await _dbHelper.deleteAllTasks();
      print('Deleted all tasks from local');
    } catch (e) {
      print('Error deleting all tasks: $e');
    }
  }

  /// Lấy tasks từ local (lightweight - cho danh sách)
  Future<List<TaskModel>> getTasksFromLocalLight({int? limit}) async {
    try {
      return await _dbHelper.getAllTasksLight(limit: limit);
    } catch (e) {
      print('Error getting tasks from local (light): $e');
      return [];
    }
  }

  /// Lấy task theo ID (wrapper cho getTaskByIdFromLocal)
  Future<TaskModel?> getTaskById(int id) async {
    return await getTaskByIdFromLocal(id);
  }

  /// Xóa task (wrapper cho deleteTaskFromLocal)
  Future<bool> deleteTask(int id) async {
    return await deleteTaskFromLocal(id);
  }
}
