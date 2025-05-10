import 'package:flutter/material.dart';
import 'data.dart';
import '../main.dart';
import 'package:flutter/material.dart';


class CategoryItem extends StatelessWidget {
  final Category category;
  final VoidCallback onClick;

  const CategoryItem({
    Key? key,
    required this.category,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              child:  Icon(category.icon, size: 40, color: Colors.pink[300]), // New Icon Widget
            ),
            const SizedBox(height: 8),
            Text(
              category.name,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
