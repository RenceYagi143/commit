import 'package:flutter/material.dart';
import '../main.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.orderHistory);
              },
              child: const Text("Order history"),
            ),
            const SizedBox(height: 10),
            //saved address
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.savedAddresses);
              },
              child: const Text("Saved Address"),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
