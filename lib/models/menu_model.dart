// lib/models/menu_model.dart
class MenuItem {
  final String id;
  final String name;
  final double price;
  final String description;
  int quantity;

  MenuItem({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    this.quantity = 1,
  });

  // Factory constructor to create a MenuItem object from a JSON map
  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      id: json['id'],
      name: json['name'],
      price: double.parse(json['price'].toString()),
      description: json['description'],
    );
  }

  // Method to convert a MenuItem object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'quantity': quantity,
    };
  }
}
