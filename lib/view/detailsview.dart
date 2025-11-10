import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  final int userId;
  final String userName;

  const DetailsView({super.key, required this.userId, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Details")),
      body: Center(
        child: Text("Welcome $userName (ID: $userId)"),
      ),
    );
  }
}
