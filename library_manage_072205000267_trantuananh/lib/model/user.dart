import 'book.dart';

class User {
  final String id;
  final String name;
  final List<Book> _borrowedBooksPrivate = [];

  User({required this.id, required this.name});

  List<Book> get borrowedBooks => List.unmodifiable(_borrowedBooksPrivate);

  void borrowBook(Book book) {
    if (!book.isBorrowed) {
      book.borrow();
      _borrowedBooksPrivate.add(book);
    }
  }

  void returnBook(Book book) {
    book.returnItem();
    _borrowedBooksPrivate.remove(book);
  }
}
