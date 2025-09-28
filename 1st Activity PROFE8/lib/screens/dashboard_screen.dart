import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/book_service.dart';
import '../widgets/custom_app_bar.dart';
import '../models/book.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  void _returnBook(Book book) {
    setState(() {
      BookService.returnBook(book);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${book.title} has been returned."),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final borrowed = BookService.borrowedBooks;

    return Scaffold(
      appBar: const CustomAppBar(title: "My Borrowed Books"),
      body: borrowed.isEmpty
          ? const Center(
              child: Text(
                "No books borrowed yet.",
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: borrowed.length,
              itemBuilder: (context, index) {
                final book = borrowed[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  elevation: 4,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.cyan,
                      child: const Icon(Icons.bookmark, color: Colors.white),
                    ),
                    title: Text(
                      book.title,
                      style: GoogleFonts.robotoSlab(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Text("by ${book.author}"),
                    trailing: ElevatedButton(
                      onPressed: () => _returnBook(book),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text("Return",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
