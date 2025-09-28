import 'package:flutter/material.dart';
import '../../models/book.dart';
import '../../services/auth_service.dart';
import '../../services/borrowing_service.dart';
import '../../widgets/custom_app_bar.dart';
import '../../utils/constants.dart';

class BookDetailScreen extends StatefulWidget {
  final Book book;

  const BookDetailScreen({Key? key, required this.book}) : super(key: key);

  @override
  _BookDetailScreenState createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  int _selectedLoanDays = 14;

  void _borrowBook() {
    if (!BorrowingService.canBorrowMore(AuthService.currentUser!.id)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('You have reached the maximum borrowing limit')),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Borrow Book'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Select loan period:'),
            SizedBox(height: 16),
            DropdownButton<int>(
              value: _selectedLoanDays,
              isExpanded: true,
              items: [7, 14, 21, 30].map((days) {
                return DropdownMenuItem(
                  value: days,
                  child: Text('$days days'),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedLoanDays = value!;
                });
                Navigator.pop(context);
                _borrowBook();
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final success = BorrowingService.borrowBook(
                AuthService.currentUser!.id,
                widget.book.id,
                _selectedLoanDays,
              );

              Navigator.pop(context);

              if (success) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Book borrowed successfully!')),
                );
                Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Failed to borrow book')),
                );
              }
            },
            child: Text('Confirm'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Book Details'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: AppColors.primaryCyan.withOpacity(0.1),
              child: Center(
                child: Text(
                  widget.book.coverImage,
                  style: TextStyle(fontSize: 80),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.book.title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'by ${widget.book.author}',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.textLight,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      _buildInfoChip(Icons.category, widget.book.genre),
                      SizedBox(width: 8),
                      _buildInfoChip(
                          Icons.calendar_today, '${widget.book.yearPublished}'),
                    ],
                  ),
                  SizedBox(height: 16),
                  _buildInfoRow('ISBN', widget.book.isbn),
                  SizedBox(height: 8),
                  _buildInfoRow('Status',
                      widget.book.isAvailable ? 'Available' : 'Borrowed'),
                  SizedBox(height: 24),
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.book.description,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textLight,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 32),
                  if (widget.book.isAvailable)
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _borrowBook,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryCyan,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Borrow This Book',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String label) {
    return Chip(
      avatar: Icon(icon, size: 16, color: AppColors.secondaryIndigo),
      label: Text(label),
      backgroundColor: AppColors.secondaryIndigo.withOpacity(0.1),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(color: AppColors.textLight),
          ),
        ),
      ],
    );
  }
}
