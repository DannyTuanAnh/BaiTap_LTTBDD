import 'library_item.dart';
import 'borrowable.dart';

class Book extends LibraryItem implements Borrowable {
  final String author;
  bool _isBorrowed = false;

  Book({required String id, required String title, required this.author})
    : super(id, title, 'book');

  @override
  bool get isBorrowed => _isBorrowed;

  @override
  void borrow() {
    _isBorrowed = true;
  }

  @override
  void returnItem() {
    _isBorrowed = false;
  }

  @override
  String get displayInfo => 'Tiêu đề: $title \nTác giả: $author \nLoại: $type';
}
