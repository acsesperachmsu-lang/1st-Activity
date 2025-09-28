import '../models/borrowing_record.dart';
import '../models/book.dart';
import '../utils/mock_data.dart';
import '../utils/constants.dart';
import 'book_service.dart';

class BorrowingService {
  static List<BorrowingRecord> getUserBorrowedBooks(String userId) {
    return MockData.borrowingRecords
        .where((record) => record.userId == userId && !record.isReturned)
        .toList();
  }

  static int getBorrowedBooksCount(String userId) {
    return getUserBorrowedBooks(userId).length;
  }

  static bool canBorrowMore(String userId) {
    return getBorrowedBooksCount(userId) < AppConstants.maxBooksPerUser;
  }

  static bool borrowBook(String userId, String bookId, int loanDays) {
    if (!canBorrowMore(userId)) return false;

    final book = BookService.getBookById(bookId);
    if (book == null || !book.isAvailable) return false;

    final record = BorrowingRecord(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      userId: userId,
      bookId: bookId,
      borrowDate: DateTime.now(),
      dueDate: DateTime.now().add(Duration(days: loanDays)),
    );

    MockData.borrowingRecords.add(record);
    BookService.updateBookAvailability(bookId, false);
    return true;
  }

  static bool returnBook(String recordId) {
    final index = MockData.borrowingRecords.indexWhere((r) => r.id == recordId);
    if (index == -1) return false;

    final record = MockData.borrowingRecords[index];
    record.isReturned = true;
    record.returnDate = DateTime.now();

    BookService.updateBookAvailability(record.bookId, true);
    return true;
  }

  static bool renewBook(String recordId) {
    final index = MockData.borrowingRecords.indexWhere((r) => r.id == recordId);
    if (index == -1) return false;

    final record = MockData.borrowingRecords[index];
    if (record.renewalCount >= 2) return false; // Max 2 renewals

    record.renewalCount++;
    // Create new record with extended due date
    final newRecord = BorrowingRecord(
      id: record.id,
      userId: record.userId,
      bookId: record.bookId,
      borrowDate: record.borrowDate,
      dueDate: record.dueDate.add(Duration(days: 7)),
      renewalCount: record.renewalCount,
    );

    MockData.borrowingRecords[index] = newRecord;
    return true;
  }

  static double getTotalFines(String userId) {
    final records = MockData.borrowingRecords
        .where((r) => r.userId == userId && !r.isReturned)
        .toList();

    double totalFines = 0;
    for (var record in records) {
      totalFines += record.fine;
    }
    return totalFines;
  }
}
