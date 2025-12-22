import 'package:flutter/material.dart';
import '../controller/library_controller.dart';

class UserManagementScreen extends StatefulWidget {
  final LibraryController controller;

  const UserManagementScreen({super.key, required this.controller});

  @override
  State<UserManagementScreen> createState() => _UserManagementScreenState();
}

class _UserManagementScreenState extends State<UserManagementScreen> {
  void _showAddUserDialog() {
    final nameController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Thêm người dùng mới'),
        content: TextField(
          controller: nameController,
          decoration: const InputDecoration(
            labelText: 'Tên người dùng',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isNotEmpty) {
                widget.controller.addUser(
                  widget.controller.generateUserId(),
                  nameController.text,
                );
                setState(() {});
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.green,
                    content: Text(
                      'Đã thêm người dùng thành công!',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }
            },
            child: const Text('Thêm'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            'Quản lý người dùng',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.controller.users.length,
        itemBuilder: (_, index) {
          final user = widget.controller.users[index];
          return ExpansionTile(
            title: Text(user.displayInfo),
            children: [
              if (user.borrowedBooks.isNotEmpty) ...[
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Sách đang mượn:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ...user.borrowedBooks.map(
                  (book) => ListTile(
                    title: Text(book.title),
                    subtitle: Text(book.author),
                    trailing: TextButton(
                      onPressed: () {
                        widget.controller.returnBook(user, book);
                        setState(() {});
                      },
                      child: const Text('Trả'),
                    ),
                  ),
                ),
                const Divider(),
              ],
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Sách có thể mượn:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ...widget.controller.books
                  .where((b) => !b.isBorrowed)
                  .map(
                    (book) => ListTile(
                      title: Text(book.title),
                      subtitle: Text(book.author),
                      trailing: TextButton(
                        onPressed: () {
                          widget.controller.borrowBook(user, book);
                          setState(() {});
                        },
                        child: const Text('Mượn'),
                      ),
                    ),
                  ),
              if (widget.controller.books.where((b) => !b.isBorrowed).isEmpty)
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Không có sách nào để mượn'),
                ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddUserDialog,
        tooltip: 'Thêm người dùng mới',
        child: const Icon(Icons.person_add),
      ),
    );
  }
}
