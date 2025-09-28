class Book {
  final String id;
  final String title;
  final String author;
  final String isbn;
  final String genre;
  final String description;
  final String coverImage;
  bool isAvailable;
  final int yearPublished;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.isbn,
    required this.genre,
    required this.description,
    required this.coverImage,
    this.isAvailable = true,
    required this.yearPublished,
  });

  // Create a copy with modified availability
  Book copyWith({bool? isAvailable}) {
    return Book(
      id: id,
      title: title,
      author: author,
      isbn: isbn,
      genre: genre,
      description: description,
      coverImage: coverImage,
      isAvailable: isAvailable ?? this.isAvailable,
      yearPublished: yearPublished,
    );
  }
}
