// lib/views/cart/checkout_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllres/cart_controller.dart';

class CheckoutView extends StatelessWidget {
  final CartController _cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Total: \$${_cartController.totalPrice}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Process payment and confirm order
              },
              child: Text('Confirm Order'),
            ),
          ],
        ),
      ),
    );
  }
}
