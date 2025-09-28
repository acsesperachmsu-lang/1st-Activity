class BorrowingRecord {
  final String id;
  final String userId;
  final String bookId;
  final DateTime borrowDate;
  final DateTime dueDate;
  DateTime? returnDate;
  bool isReturned;
  int renewalCount;

  BorrowingRecord({
    required this.id,
    required this.userId,
    required this.bookId,
    required this.borrowDate,
    required this.dueDate,
    this.returnDate,
    this.isReturned = false,
    this.renewalCount = 0,
  });

  bool get isOverdue => !isReturned && DateTime.now().isAfter(dueDate);

  int get overdueDays {
    if (!isOverdue) return 0;
    return DateTime.now().difference(dueDate).inDays;
  }

  double get fine => overdueDays * 0.50;
}
