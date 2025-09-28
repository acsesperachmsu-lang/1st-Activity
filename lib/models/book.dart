class Book {
  final String id;
  final String title;
  final String author;
  bool isAvailable;

  Book({
    required this.id,
    required this.title,
    required this.author,
    this.isAvailable = true,
  });
}
