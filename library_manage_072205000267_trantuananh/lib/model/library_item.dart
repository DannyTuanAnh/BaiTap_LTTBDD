abstract class LibraryItem {
  final String id;
  final String title;

  LibraryItem(this.id, this.title);

  String get displayInfo;
}
