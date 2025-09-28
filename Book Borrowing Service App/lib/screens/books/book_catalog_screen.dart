import 'package:flutter/material.dart';
import '../../models/book.dart';
import '../../services/book_service.dart';
import '../../services/auth_service.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/book_card.dart';
import '../../utils/constants.dart';
import 'book_detail_screen.dart';
import '../dashboard/user_dashboard_screen.dart';
import '../admin/admin_panel_screen.dart';
import '../auth/login_screen.dart';
import '../../models/user.dart';

class BookCatalogScreen extends StatefulWidget {
  @override
  _BookCatalogScreenState createState() => _BookCatalogScreenState();
}

class _BookCatalogScreenState extends State<BookCatalogScreen> {
  List<Book> _books = [];
  List<Book> _filteredBooks = [];
  final _searchController = TextEditingController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadBooks();
  }

  void _loadBooks() {
    _books = BookService.getAllBooks();
    _filteredBooks = _books;
  }

  void _searchBooks(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredBooks = _books;
      } else {
        _filteredBooks = BookService.searchBooks(query);
      }
    });
  }

  void _navigateToScreen(int index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => UserDashboardScreen()),
      ).then((_) => _loadBooks());
    } else if (index == 2) {
      if (AuthService.currentUser?.type == UserType.librarian) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => AdminPanelScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Admin access only')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Book Catalog',
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              AuthService.logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.white,
            child: TextField(
              controller: _searchController,
              onChanged: _searchBooks,
              decoration: InputDecoration(
                hintText: 'Search by title, author, or ISBN',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: AppColors.backgroundWhite,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: _filteredBooks.length,
              itemBuilder: (context, index) {
                final book = _filteredBooks[index];
                return BookCard(
                  book: book,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BookDetailScreen(book: book),
                      ),
                    ).then((_) => _loadBooks());
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _navigateToScreen(index);
        },
        selectedItemColor: AppColors.primaryCyan,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Catalog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.admin_panel_settings),
            label: 'Admin',
          ),
        ],
      ),
    );
  }
}
