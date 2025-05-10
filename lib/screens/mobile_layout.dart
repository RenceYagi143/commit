import 'package:flutter/material.dart';

class MobileLayout extends StatelessWidget {
  final Widget child;

  const MobileLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          child,
        ],
      ),
    );
  }
}