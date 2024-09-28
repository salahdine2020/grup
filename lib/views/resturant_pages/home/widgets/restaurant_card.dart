// lib/views/home/widgets/restaurant_card.dart
import 'package:flutter/material.dart';

import '../../../../models/restaurant_model.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantCard({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(restaurant.name),
        subtitle: Text(restaurant.description),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          // Navigate to restaurant detail
        },
      ),
    );
  }
}
