import 'package:flutter/material.dart';
import '../services/book_service.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/book_card.dart';
import 'book_detail_screen.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final books = BookService.getAllBooks();

    return Scaffold(
      appBar: const CustomAppBar(title: "Book Catalog"),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return BookCard(
            book: book,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BookDetailScreen(book: book),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
