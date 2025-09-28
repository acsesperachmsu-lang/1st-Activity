import '../models/book.dart';
import '../utils/mock_data.dart';

class BookService {
  static List<Book> getAllBooks() {
    return MockData.books;
  }

  static List<Book> getAvailableBooks() {
    return MockData.books.where((book) => book.isAvailable).toList();
  }

  static Book? getBookById(String id) {
    try {
      return MockData.books.firstWhere((book) => book.id == id);
    } catch (e) {
      return null;
    }
  }

  static List<Book> searchBooks(String query) {
    final lowercaseQuery = query.toLowerCase();
    return MockData.books.where((book) {
      return book.title.toLowerCase().contains(lowercaseQuery) ||
          book.author.toLowerCase().contains(lowercaseQuery) ||
          book.isbn.contains(query);
    }).toList();
  }

  static void updateBookAvailability(String bookId, bool isAvailable) {
    final index = MockData.books.indexWhere((book) => book.id == bookId);
    if (index != -1) {
      MockData.books[index] =
          MockData.books[index].copyWith(isAvailable: isAvailable);
    }
  }
}
