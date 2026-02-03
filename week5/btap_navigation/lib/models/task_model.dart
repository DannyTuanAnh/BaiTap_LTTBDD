/// Model cho Subtask
class Subtask {
  final int id;
  final String title;
  final bool isCompleted;

  Subtask({required this.id, required this.title, required this.isCompleted});

  factory Subtask.fromJson(Map<String, dynamic> json) {
    // Handle id as either int, double, or String
    int id = 0;
    if (json['id'] != null) {
      if (json['id'] is num) {
        id = (json['id'] as num).toInt();
      } else if (json['id'] is String) {
        id = int.tryParse(json['id'] as String) ?? 0;
      }
    }

    return Subtask(
      id: id,
      title: json['title']?.toString() ?? '',
      isCompleted: json['isCompleted'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'isCompleted': isCompleted};
  }
}

/// Model cho Attachment
class Attachment {
  final int id;
  final String fileName;
  final String fileUrl;

  Attachment({required this.id, required this.fileName, required this.fileUrl});

  factory Attachment.fromJson(Map<String, dynamic> json) {
    // Handle id as either int, double, or String
    int id = 0;
    if (json['id'] != null) {
      if (json['id'] is num) {
        id = (json['id'] as num).toInt();
      } else if (json['id'] is String) {
        id = int.tryParse(json['id'] as String) ?? 0;
      }
    }

    return Attachment(
      id: id,
      fileName: json['fileName']?.toString() ?? '',
      fileUrl: json['fileUrl']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'fileName': fileName, 'fileUrl': fileUrl};
  }
}

/// Model cho Reminder
class Reminder {
  final int id;
  final DateTime time;
  final String type;

  Reminder({required this.id, required this.time, required this.type});

  factory Reminder.fromJson(Map<String, dynamic> json) {
    // Handle id as either int, double, or String
    int id = 0;
    if (json['id'] != null) {
      if (json['id'] is num) {
        id = (json['id'] as num).toInt();
      } else if (json['id'] is String) {
        id = int.tryParse(json['id'] as String) ?? 0;
      }
    }

    return Reminder(
      id: id,
      time: DateTime.tryParse(json['time']?.toString() ?? '') ?? DateTime.now(),
      type: json['type']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'time': time.toIso8601String(), 'type': type};
  }
}

/// Model chính cho Task
class TaskModel {
  final int id;
  final String title;
  final String description;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    // Handle id as either int, double, or String
    int id = 0;
    if (json['id'] != null) {
      if (json['id'] is num) {
        id = (json['id'] as num).toInt();
      } else if (json['id'] is String) {
        id = int.tryParse(json['id'] as String) ?? 0;
      }
    }

    return TaskModel(
      id: id,
      title: json['title']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      status: json['status']?.toString() ?? 'Pending',
      createdAt:
          DateTime.tryParse(json['createdAt']?.toString() ?? '') ??
          DateTime.now(),
      updatedAt:
          DateTime.tryParse(json['updatedAt']?.toString() ?? '') ??
          DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
