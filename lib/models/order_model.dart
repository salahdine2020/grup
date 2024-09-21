// lib/models/order_model.dart
import 'menu_model.dart';

class Order {
  final String id;
  final List<MenuItem> items;
  final double total;
  final String status;
  final DateTime createdAt;

  Order({
    required this.id,
    required this.items,
    required this.total,
    required this.status,
    required this.createdAt,
  });

  // Factory constructor to create an Order object from a JSON map
  factory Order.fromJson(Map<String, dynamic> json) {
    List<MenuItem> items = (json['items'] as List)
        .map((itemJson) => MenuItem.fromJson(itemJson))
        .toList();

    return Order(
      id: json['id'],
      items: items,
      total: double.parse(json['total'].toString()),
      status: json['status'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  // Method to convert an Order object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'items': items.map((item) => item.toJson()).toList(),
      'total': total,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
