📚 Library Book Borrowing App

This project is a simple Library Book Borrowing App made with Flutter.
The idea is to show how Flutter can be used to make a small service app.
🎯 About the App

The app lets users:

Browse available books in a catalog

View book details

Borrow books (with a confirmation dialog)

See a counter for how many books have been borrowed

Check borrowed books in a dashboard

There’s no database — the books are just stored as sample/mock data in the code.

🗂️ Project Structure
lib/
├── main.dart
├── models/
│   └── book.dart
├── services/
│   └── book_service.dart
├── widgets/
│   ├── custom_app_bar.dart
│   ├── borrow_button.dart
│   └── book_card.dart
├── screens/
│   ├── catalog_screen.dart
│   ├── book_detail_screen.dart
│   └── dashboard_screen.dart


models – holds the book model

services – contains the logic for handling books (borrow, get all books, etc.)

widgets – reusable UI parts (AppBar, button, book card)

screens – main pages of the app (catalog, book detail, dashboard)

I arranged it this way so that the code is organized and easier to follow. Each folder has its own role and avoids mixing UI with logic.

🚀 How to Run

Save the project into your Flutter environment.

Run the commands:

flutter pub get
flutter run


Features to test:

Borrow a book → confirm with Cupertino dialog

Counter updates when borrowing

Borrowed books appear in dashboard