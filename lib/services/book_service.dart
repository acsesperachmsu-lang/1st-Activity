import '../models/book.dart';

class BookService {
  static List<Book> books = [
    Book(id: '1', title: 'Harry Potter', author: 'J.K. Rowling'),
    Book(id: '2', title: 'The Hobbit', author: 'J.R.R. Tolkien'),
    Book(id: '3', title: '1984', author: 'George Orwell'),
  ];

  static List<Book> borrowedBooks = [];

  static List<Book> getAllBooks() => books;

  static void borrowBook(Book book) {
    book.isAvailable = false;
    borrowedBooks.add(book);
  }

  static void returnBook(Book book) {
    book.isAvailable = true;
    borrowedBooks.remove(book);
  }
}
