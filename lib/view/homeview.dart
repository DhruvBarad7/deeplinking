import 'package:deeplinking/controller/home_controller.dart';
import 'package:deeplinking/model/usermodel.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  final HomeController controller = HomeController();

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = UserModel(id: 101, name: "Dhruv");

    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("Open Deep Link (myapp://details/101/Dhruv)"),
              onPressed: () async {
                await controller.launchExternalURL("https://dhruvbuilds.com");
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text("Open Website (example.com)"),
              onPressed: () async {
                await controller.launchExternalURL("https://dhruvbuilds.com");
              },
            ),
          ],
        ),
      ),
    );
  }
}
