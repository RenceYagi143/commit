import 'package:flutter/material.dart';

class Restaurant {
  final String id;
  final String name;
  final double rating;
  final bool isNew;

  const Restaurant({
    required this.id,
    required this.name,
    required this.rating,
    required this.isNew,
  });
}

class Promotion {
  final String id;
  final String name;

  const Promotion({
    required this.id,
    required this.name,
  });
}

class Category {
      final String id;
      final String name;
      final IconData icon; // Changed from imageUrl to icon

      const Category({
        required this.id,
        required this.name,
        required this.icon, // Changed from imageUrl to icon
      });
    }


const List<Restaurant> restaurants = [
  Restaurant(id: '1', name: 'Jolibee', rating: 4.7, isNew: false),
  Restaurant(id: '2', name: 'Mcdonalds', rating: 4.2, isNew: true),
  Restaurant(id: '3', name: 'Chowking', rating: 4.9, isNew: true),
  Restaurant(id: '4', name: 'KFC', rating: 4.3, isNew: false),
  Restaurant(id: '5', name: 'Mang Inasal', rating: 4.6, isNew: true),
];

const List<Promotion> promotions = [
  Promotion(id: '1', name: '20% off Pizza'),
  Promotion(id: '2', name: 'Free Burger with Combo'),
  Promotion(id: '3', name: 'Sushi Night - 15% off'),
];

const List<Category> categories = [
          Category(id: '1', name: 'Breakfast', icon: Icons.breakfast_dining), // Changed to IconData
          Category(id: '2', name: 'Lunch', icon: Icons.lunch_dining), // Changed to IconData
          Category(id: '3', name: 'Dinner', icon: Icons.dinner_dining), // Changed to IconData
          Category(id: '4', name: 'Cafe', icon: Icons.local_cafe), // Changed to IconData
          Category(id: '5', name: 'Fast Food', icon: Icons.fastfood), // Changed to IconData
          Category(id: '6', name: 'Desserts', icon: Icons.cake), // Changed to IconData
        ];

