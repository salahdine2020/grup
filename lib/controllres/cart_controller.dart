// lib/controllers/cart_controller.dart
import 'package:get/get.dart';
import '../models/menu_model.dart';

class CartController extends GetxController {
  var cartItems = <MenuItem>[].obs;
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));

  void addItem(MenuItem item) {
    int index = cartItems.indexWhere((i) => i.id == item.id);
    if (index != -1) {
      cartItems[index].quantity++;
      cartItems.refresh();
    } else {
      cartItems.add(item);
    }
  }

  void removeItem(MenuItem item) {
    cartItems.remove(item);
  }
}
