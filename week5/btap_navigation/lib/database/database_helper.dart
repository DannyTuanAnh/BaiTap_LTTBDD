import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/task_model.dart';

/// Database Helper - Quản lý SQLite database
/// Singleton pattern để đảm bảo chỉ có 1 instance
class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'smart_tasks.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    // Tạo bảng tasks - ĐƠN GIẢN HÓA: chỉ cần title và description
    await db.execute('''
      CREATE TABLE tasks(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        description TEXT,
        status TEXT DEFAULT 'Pending',
        createdAt TEXT,
        updatedAt TEXT
      )
    ''');
  }

  /// Thêm task mới
  Future<int> insertTask(TaskModel task) async {
    try {
      final db = await database;

      final taskId = await db.insert('tasks', {
        'title': task.title,
        'description': task.description,
        'status': task.status,
        'createdAt': task.createdAt.toIso8601String(),
        'updatedAt': task.updatedAt.toIso8601String(),
      });
      return taskId;
    } catch (e) {
      rethrow;
    }
  }

  /// Lấy tất cả tasks - ĐƠN GIẢN HÓA
  Future<List<TaskModel>> getAllTasks({int? limit}) async {
    final db = await database;
    final taskMaps = await db.query(
      'tasks',
      orderBy: 'createdAt DESC',
      limit: limit,
    );

    print('Loading ${taskMaps.length} tasks from database...');
    List<TaskModel> tasks = [];

    for (var taskMap in taskMaps) {
      tasks.add(
        TaskModel(
          id: taskMap['id'] as int,
          title: taskMap['title'] as String,
          description: taskMap['description'] as String? ?? '',
          status: taskMap['status'] as String? ?? 'Pending',
          createdAt: DateTime.parse(taskMap['createdAt'] as String),
          updatedAt: DateTime.parse(taskMap['updatedAt'] as String),
        ),
      );
    }

    return tasks;
  }

  /// Lấy tất cả tasks (lightweight - giống getAllTasks vì đã đơn giản)
  Future<List<TaskModel>> getAllTasksLight({int? limit}) async {
    return getAllTasks(limit: limit);
  }

  /// Lấy task theo ID - ĐƠN GIẢN HÓA
  Future<TaskModel?> getTaskById(int id) async {
    final db = await database;
    final taskMaps = await db.query('tasks', where: 'id = ?', whereArgs: [id]);

    if (taskMaps.isEmpty) return null;

    final taskMap = taskMaps.first;

    return TaskModel(
      id: taskMap['id'] as int,
      title: taskMap['title'] as String,
      description: taskMap['description'] as String? ?? '',
      status: taskMap['status'] as String? ?? 'Pending',
      createdAt: DateTime.parse(taskMap['createdAt'] as String),
      updatedAt: DateTime.parse(taskMap['updatedAt'] as String),
    );
  }

  /// Cập nhật task - ĐƠN GIẢN HÓA
  Future<int> updateTask(TaskModel task) async {
    final db = await database;

    final result = await db.update(
      'tasks',
      {
        'title': task.title,
        'description': task.description,
        'status': task.status,
        'updatedAt': DateTime.now().toIso8601String(),
      },
      where: 'id = ?',
      whereArgs: [task.id],
    );

    return result;
  }

  /// Xóa task - ĐƠN GIẢN HÓA
  Future<int> deleteTask(int id) async {
    final db = await database;
    return await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }

  /// Xóa tất cả tasks
  Future<void> deleteAllTasks() async {
    final db = await database;
    await db.delete('tasks');
  }
}
