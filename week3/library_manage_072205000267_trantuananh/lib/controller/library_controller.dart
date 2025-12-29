import '../model/book.dart';
import '../model/user.dart';

class LibraryController {
  final List<Book> books = [
    Book(id: '1', title: 'Đắc nhân tâm', author: 'Dale Carnegie'),
    Book(id: '2', title: 'Nhà giả kim', author: 'Paulo Coelho'),
    Book(id: '3', title: 'Cha Giàu, Cha Nghèo', author: 'Robert T. Kiyosaki'),
  ];

  final List<User> users = [
    User(id: 'u1', name: 'Trần Hải Đăng'),
    User(id: 'u2', name: 'Trần Hoàng Phương'),
    User(id: 'u3', name: 'Hồ Tấn Đạt'),
  ];

  void borrowBook(User user, Book book) {
    user.borrowBook(book);
  }

  void returnBook(User user, Book book) {
    user.returnBook(book);
  }

  void addBook(String id, String title, String author) {
    books.add(Book(id: id, title: title, author: author));
  }

  void addUser(String id, String name) {
    users.add(User(id: id, name: name));
  }

  String generateBookId() {
    return (books.length + 1).toString();
  }

  String generateUserId() {
    return 'u${users.length + 1}';
  }
}
