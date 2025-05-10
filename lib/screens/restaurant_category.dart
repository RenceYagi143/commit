import 'package:flutter/material.dart';

import 'data.dart';

class RestaurantCategory extends StatelessWidget {
  final Restaurant restaurant;
  final bool horizontal;
  final VoidCallback onClick;
  const RestaurantCategory(
      {Key? key, required this.restaurant, this.horizontal = true, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onClick,
        child: horizontal
            ? SizedBox(
                width: 150,
                child: Column(
                  children: [
                    Image.network(
                      'https://via.placeholder.com/150',
                      width: 150,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(restaurant.name),
                        Text('${restaurant.rating}'),
                      ],
                    ),
                  ],
                ),
              )
            : Row(
                children: [
                  Image.network(
                    'https://via.placeholder.com/150',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 8),
                ],
              ));
  }
}
