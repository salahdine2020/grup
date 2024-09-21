// lib/models/restaurant_model.dart
class Restaurant {
  final String id;
  final String name;
  final String description;
  final String imageUrl;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  // Factory constructor to create a Restaurant object from a JSON map
  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
    );
  }

  // Method to convert a Restaurant object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
    };
  }
}
