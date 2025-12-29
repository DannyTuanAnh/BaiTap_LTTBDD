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
                  const SnackBar(
                    backgroundColor: Colors.green,
                    content: Text(
                      'Đã thêm sách thành công!',
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
            'Quản lý sách',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: widget.controller.books.length,
        itemBuilder: (_, index) {
          final book = widget.controller.books[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset.zero,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Thông tin sách
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          book.displayInfo,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 6),
                      ],
                    ),
                  ),
                  // Trạng thái mượn
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: book.isBorrowed ? Colors.red : Colors.green,
                        width: 2,
                      ),
                      color: book.isBorrowed
                          ? Colors.red.withOpacity(0.1)
                          : Colors.green.withOpacity(0.1),
                    ),
                    child: Text(
                      book.isBorrowed ? 'Đã mượn' : 'Còn',
                      style: TextStyle(
                        color: book.isBorrowed ? Colors.red : Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
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
