import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/book.dart';
import '../services/book_service.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/borrow_button.dart';

class BookDetailScreen extends StatefulWidget {
  final Book book;
  const BookDetailScreen({super.key, required this.book});

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  int borrowedCount = BookService.borrowedBooks.length;

  void _borrowBook() {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text("Confirm Borrow"),
        content: Text("Do you want to borrow '${widget.book.title}'?"),
        actions: [
          CupertinoDialogAction(
            child: const Text("Cancel"),
            onPressed: () => Navigator.pop(context),
          ),
          CupertinoDialogAction(
            child: const Text("Borrow"),
            onPressed: () {
              setState(() {
                BookService.borrowBook(widget.book);
                borrowedCount = BookService.borrowedBooks.length;
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Book borrowed successfully!"),
                  backgroundColor: Colors.green,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.book.title),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Icon(Icons.book, size: 100, color: Colors.cyan[600]),
            ),
            const SizedBox(height: 20),
            Text(
              widget.book.title,
              style: GoogleFonts.robotoSlab(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text("Author: ${widget.book.author}",
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            Text("Borrowed Books Counter: $borrowedCount",
                style: const TextStyle(fontSize: 16)),
            const Spacer(),
            if (widget.book.isAvailable)
              BorrowButton(label: "Borrow Book", onPressed: _borrowBook),
          ],
        ),
      ),
    );
  }
}
