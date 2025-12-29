class LibraryItem {
  final String id;
  final String title;
  final String type;

  LibraryItem(this.id, this.title, this.type);

  String get displayInfo => '$title (Type: $type)';
}
