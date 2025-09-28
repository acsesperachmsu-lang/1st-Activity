import '../models/book.dart';
import '../models/user.dart';
import '../models/borrowing_record.dart';

class MockData {
  static List<Book> books = [
    Book(
      id: '1',
      title: "Harry Potter and the Philosopher's Stone",
      author: 'J.K. Rowling',
      isbn: '978-0439708180',
      genre: 'Fantasy',
      description:
          'Harry Potter discovers he is a wizard on his 11th birthday and attends Hogwarts School of Witchcraft and Wizardry.',
      coverImage: '📘',
      yearPublished: 1997,
    ),
    Book(
      id: '2',
      title: 'Harry Potter and the Chamber of Secrets',
      author: 'J.K. Rowling',
      isbn: '978-0439064873',
      genre: 'Fantasy',
      description:
          'Harry returns to Hogwarts and faces the mystery of the Chamber of Secrets.',
      coverImage: '📗',
      yearPublished: 1998,
    ),
    Book(
      id: '3',
      title: 'Harry Potter and the Prisoner of Azkaban',
      author: 'J.K. Rowling',
      isbn: '978-0439136365',
      genre: 'Fantasy',
      description:
          'Harry learns about Sirius Black and confronts the Dementors.',
      coverImage: '📙',
      yearPublished: 1999,
    ),
    Book(
      id: '4',
      title: 'Harry Potter and the Goblet of Fire',
      author: 'J.K. Rowling',
      isbn: '978-0439139601',
      genre: 'Fantasy',
      description: 'Harry competes in the dangerous Triwizard Tournament.',
      coverImage: '📕',
      yearPublished: 2000,
    ),
    Book(
      id: '5',
      title: 'Harry Potter and the Order of the Phoenix',
      author: 'J.K. Rowling',
      isbn: '978-0439358071',
      genre: 'Fantasy',
      description: 'Harry forms Dumbledore\'s Army to fight against Voldemort.',
      coverImage: '📘',
      yearPublished: 2003,
    ),
    Book(
      id: '6',
      title: 'Harry Potter and the Half-Blood Prince',
      author: 'J.K. Rowling',
      isbn: '978-0439785969',
      genre: 'Fantasy',
      description: 'Harry learns about Voldemort\'s past and the Horcruxes.',
      coverImage: '📗',
      yearPublished: 2005,
    ),
    Book(
      id: '7',
      title: 'Harry Potter and the Deathly Hallows',
      author: 'J.K. Rowling',
      isbn: '978-0545139700',
      genre: 'Fantasy',
      description: 'The final battle between Harry and Voldemort.',
      coverImage: '📕',
      yearPublished: 2007,
    ),
  ];

  static List<User> users = [
    User(
      id: '1',
      name: 'John Student',
      email: 'john@student.com',
      password: 'password123',
      type: UserType.student,
      memberSince: DateTime(2023, 1, 15),
      booksRead: 12,
      favoriteGenre: 'Fantasy',
    ),
    User(
      id: '2',
      name: 'Sarah Librarian',
      email: 'sarah@library.com',
      password: 'admin123',
      type: UserType.librarian,
      memberSince: DateTime(2020, 6, 1),
      booksRead: 45,
      favoriteGenre: 'Fantasy',
    ),
  ];

  static List<BorrowingRecord> borrowingRecords = [];
}
