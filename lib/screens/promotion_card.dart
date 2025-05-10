import 'package:flutter/material.dart';
import 'data.dart';

class PromotionCard extends StatelessWidget {
  final Promotion promotion;

  const PromotionCard({super.key, required this.promotion});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Image.network(
            'https://via.placeholder.com/150',
            width: 150,
            height: 100,
            fit: BoxFit.cover,
          ),
          Text(promotion.name),
        ],
      ),
    );
  }
}