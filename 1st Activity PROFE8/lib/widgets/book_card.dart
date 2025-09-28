import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/book.dart';

class BookCard extends StatelessWidget {
  final Book book;
  final VoidCallback onTap;

  const BookCard({super.key, required this.book, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.cyan,
          child: const Icon(Icons.book, color: Colors.white),
        ),
        title: Text(
          book.title,
          style: GoogleFonts.robotoSlab(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text("by ${book.author}"),
        trailing: Text(
          book.isAvailable ? "Available" : "Borrowed",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: book.isAvailable ? Colors.green : Colors.red,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
