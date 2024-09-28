import 'package:get/get.dart';
import '../../models/client_models/fooditems_model.dart';

class CartController extends GetxController {
  // List of food items
  var foodItems = <FoodItem>[].obs;

  // Add a food item to the list (if not added already)
  void addItem(FoodItem item) {
    foodItems.add(item);
  }

  void clearAllItem() {
    foodItems.clear();
  }

  // Increase the quantity for a specific size (S, M, L, XL)
  void incrementQuantity(int id, String size) {
    var item = foodItems.firstWhere((element) => element.id == id);
    item.quantities[size]!.value++; // Increment the quantity for the given size
    foodItems.refresh(); // Refresh the UI to reflect the changes
  }

  // Decrease the quantity for a specific size (S, M, L, XL)
  void decrementQuantity(int id, String size) {
    var item = foodItems.firstWhere((element) => element.id == id);
    if (item.quantities[size]! > 0) {
      item.quantities[size]!.value--; // Decrement the quantity for the given size
      foodItems.refresh(); // Refresh the UI to reflect the changes
    }
  }
}
