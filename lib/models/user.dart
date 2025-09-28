class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final UserType type;
  final DateTime memberSince;
  int booksRead;
  String favoriteGenre;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.type,
    required this.memberSince,
    this.booksRead = 0,
    this.favoriteGenre = 'Fantasy',
  });
}

enum UserType { student, librarian }
