import 'package:flutter/material.dart';
import '../controller/library_controller.dart';

class BookManagementScreen extends StatefulWidget {
  final LibraryController controller;

  const BookManagementScreen({super.key, required this.controller});

  @override
  State<BookManagementScreen> createState() => _BookManagementScreenState();
}

class _BookManagementScreenState extends State<BookManagementScreen> {
  void _showAddBookDialog() {
    final titleController = TextEditingController();
    final authorController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Thêm sách mới'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Tiêu đề sách',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: authorController,
              decoration: const InputDecoration(
                labelText: 'Tác giả',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          ElevatedButton(
            onPressed: () {
              if (titleController.text.isNotEmpty &&
                  authorController.text.isNotEmpty) {
                widget.controller.addBook(
                  widget.controller.generateBookId(),
                  titleController.text,
                  authorController.text,
                );
                setState(() {});
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Đã thêm sách thành công!')),
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
      body: ListView.builder(
        itemCount: widget.controller.books.length,
        itemBuilder: (_, index) {
          final book = widget.controller.books[index];
          return ListTile(
            title: Text(book.displayInfo),
            trailing: Text(
              book.isBorrowed ? 'Đã mượn' : 'Còn',
              style: TextStyle(
                color: book.isBorrowed ? Colors.red : Colors.green,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddBookDialog,
        tooltip: 'Thêm sách mới',
        child: const Icon(Icons.add),
      ),
    );
  }
}
