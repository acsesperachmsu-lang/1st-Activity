# 📐 Widget Tree Diagram - Library Book Borrowing App

MaterialApp
 └── SplashScreen (StatefulWidget)
      └── Scaffold
          └── Center
              ├── Icon (library_books)
              ├── Text ("Library Borrowing App")
              └── CircularProgressIndicator

After Splash → MainScreen (StatefulWidget)
 └── Scaffold
     ├── Body
     │   ├── CatalogScreen (StatelessWidget)
     │   │    └── Scaffold
     │         ├── CustomAppBar
     │         └── ListView
     │              └── BookCard (StatelessWidget, reusable)
     │                   ├── CircleAvatar (Icon: book)
     │                   ├── Text (Book Title - GoogleFonts)
     │                   └── Text (Availability)
     │
     │   └── DashboardScreen (StatefulWidget)
     │        └── Scaffold
     │            ├── CustomAppBar
     │            └── ListView
     │                 └── Card
     │                      ├── CircleAvatar (Icon: bookmark)
     │                      ├── Text (Book Title - GoogleFonts)
     │                      └── ElevatedButton ("Return")
     │
     └── BottomNavigationBar
          ├── Item: Catalog
          └── Item: Dashboard

BookDetailScreen (StatefulWidget)
 └── Scaffold
     ├── CustomAppBar
     └── Column
         ├── Icon (book)
         ├── Text (Book Title - GoogleFonts)
         ├── Text (Author)
         ├── Text (Borrowed Counter)
         └── BorrowButton (Reusable Custom Button)
             └── CupertinoAlertDialog (Confirm Borrow)
