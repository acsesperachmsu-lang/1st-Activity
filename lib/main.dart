import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const LibraryApp());
}

class LibraryApp extends StatelessWidget {
  const LibraryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Library Borrowing Service',
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: const SplashScreen(),
    );
  }
}
