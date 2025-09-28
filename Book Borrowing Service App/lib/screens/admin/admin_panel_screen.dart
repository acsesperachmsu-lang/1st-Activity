import 'package:flutter/material.dart';
import '../../widgets/custom_app_bar.dart';

class AdminPanelScreen extends StatelessWidget {
  const AdminPanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Admin Panel"),
      body: const Center(
        child: Text("This is the Admin Panel screen"),
      ),
    );
  }
}
