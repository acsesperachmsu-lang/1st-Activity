import 'package:flutter/material.dart';
import '../../widgets/custom_app_bar.dart';

class UserDashboardScreen extends StatelessWidget {
  const UserDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "User Dashboard"),
      body: const Center(
        child: Text("This is the User Dashboard screen"),
      ),
    );
  }
}
