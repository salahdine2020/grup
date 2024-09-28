import 'package:get/get.dart';

class FoodItem {
  final int id;
  final String name;
  final String imageUrl;
  final String priceRange;
  final Map<String, RxInt> quantities;

  // Constructor
  FoodItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.priceRange,
  }) : quantities = {
    'S': 0.obs,  // Initializes small size quantity
    'M': 0.obs,  // Initializes medium size quantity
    'L': 0.obs,  // Initializes large size quantity
    'XL': 0.obs, // Initializes extra-large size quantity
  };  // Initializes quantities for each size as an observable
}
