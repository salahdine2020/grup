// import 'package:get/get.dart';
// import 'package:grup/models/client_models/order_model.dart';
//
// class OrderController extends GetxController {
//   var order = Order(restaurantName: '', address: '', imageUrl: '', totalPrice: 0.0).obs;
//
//   void setOrder(String restaurantName, String address, String imageUrl, double totalPrice) {
//     order.value = Order(
//       restaurantName: restaurantName,
//       address: address,
//       imageUrl: imageUrl,
//       totalPrice: totalPrice,
//     );
//   }
// }


import 'package:get/get.dart';
import 'package:grup/models/client_models/order_model.dart';

class OrderController extends GetxController {
  var orders = <Order>[].obs;  // Now it's a list of orders

  // Add a new order to the list
  void addOrder(String restaurantName, String address, String imageUrl, double totalPrice) {
    orders.add(Order(
      restaurantName: restaurantName,
      address: address,
      imageUrl: imageUrl,
      totalPrice: totalPrice,
    ));
  }
}
