// lib/views/cart/cart_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grup/controllres/resturant_controller/cart_controller.dart';

class CartView extends StatelessWidget {
  final CartController _cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('cart'.tr),
      ),
      body: Obx(() {
        if (_cartController.cartItems.isEmpty) {
          return Center(child: Text('Your cart is empty.'));
        }
        return ListView.builder(
          itemCount: _cartController.cartItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_cartController.cartItems[index].name),
              subtitle: Text('${_cartController.cartItems[index].quantity} x \$${_cartController.cartItems[index].price}'),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  _cartController.removeItem(_cartController.cartItems[index]);
                },
              ),
            );
          },
        );
      }),
      bottomNavigationBar: Obx(() {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              if (_cartController.cartItems.isNotEmpty) {
                Get.toNamed('/checkout');
              }
            },
            child: Text('Proceed to Checkout (\$${_cartController.totalPrice})'),
          ),
        );
      }),
    );
  }
}
