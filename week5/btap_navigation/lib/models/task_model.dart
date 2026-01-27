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
  final String priority;
  final String category;
  final DateTime dueDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Subtask> subtasks;
  final List<Attachment> attachments;
  final List<Reminder> reminders;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.priority,
    required this.category,
    required this.dueDate,
    required this.createdAt,
    required this.updatedAt,
    required this.subtasks,
    required this.attachments,
    required this.reminders,
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
      priority: json['priority']?.toString() ?? 'Medium',
      category: json['category']?.toString() ?? '',
      dueDate:
          DateTime.tryParse(json['dueDate']?.toString() ?? '') ??
          DateTime.now(),
      createdAt:
          DateTime.tryParse(json['createdAt']?.toString() ?? '') ??
          DateTime.now(),
      updatedAt:
          DateTime.tryParse(json['updatedAt']?.toString() ?? '') ??
          DateTime.now(),
      subtasks:
          (json['subtasks'] as List<dynamic>?)
              ?.map((e) => Subtask.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      attachments:
          (json['attachments'] as List<dynamic>?)
              ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      reminders:
          (json['reminders'] as List<dynamic>?)
              ?.map((e) => Reminder.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'status': status,
      'priority': priority,
      'category': category,
      'dueDate': dueDate.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'subtasks': subtasks.map((e) => e.toJson()).toList(),
      'attachments': attachments.map((e) => e.toJson()).toList(),
      'reminders': reminders.map((e) => e.toJson()).toList(),
    };
  }
}
