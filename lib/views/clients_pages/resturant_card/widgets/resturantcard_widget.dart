import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controllres/client_controller/carte_controller.dart';
import '../../../../models/client_models/fooditems_model.dart';

class RestaurantCardWidget extends StatelessWidget {
  final FoodItem foodItem;

  // GetX controller for managing cart
  final CartController cartController = Get.put(CartController());

  RestaurantCardWidget({
    super.key,
    required this.foodItem,
  });

  // List of possible sizes
  final List<String> sizes = ['S', 'M', 'L', 'XL'];

  @override
  Widget build(BuildContext context) {
    // Variable to track the current size index
    final RxInt currentSizeIndex = 0.obs;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, right: 0, left: 8),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              foodItem.imageUrl,
              height: 40,
              width: 40,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            foodItem.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            foodItem.priceRange,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          trailing: SizedBox(
            width: 115, // You can adjust this width as needed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Decrement size button
                      IconButton(
                        onPressed: () {
                          // Decrement size index, ensuring it wraps around
                          if (currentSizeIndex.value > 0) {
                            currentSizeIndex.value--;
                          } else {
                            currentSizeIndex.value = sizes.length - 1;
                          }
                        },
                        icon: const Icon(Icons.remove_circle_outline),
                        iconSize: 18,
                        color: Colors.black,
                      ),
                      // Display current size (S, M, L, XL)
                      Obx(() => Text(
                        sizes[currentSizeIndex.value],
                        style: const TextStyle(fontSize: 12),
                      )),
                      // Increment size button
                      IconButton(
                        onPressed: () {
                          // Increment size index, ensuring it wraps around
                          if (currentSizeIndex.value < sizes.length - 1) {
                            currentSizeIndex.value++;
                          } else {
                            currentSizeIndex.value = 0;
                          }
                        },
                        icon: const Icon(Icons.add_circle_outline),
                        iconSize: 18,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Decrement quantity button
                      IconButton(
                        onPressed: () {
                          // Decrease the quantity for the selected size
                          String currentSize = sizes[currentSizeIndex.value];
                          cartController.decrementQuantity(
                              foodItem.id, currentSize);
                        },
                        icon: const Icon(Icons.remove_circle_outline),
                        iconSize: 18,
                        color: Colors.black,
                      ),
                      // Display current quantity for the selected size
                      Obx(() => Text(
                        '${foodItem.quantities[sizes[currentSizeIndex.value]]!.value}',
                        style: const TextStyle(fontSize: 12),
                      )),
                      // Increment quantity button
                      IconButton(
                        onPressed: () {
                          // Increase the quantity for the selected size
                          String currentSize = sizes[currentSizeIndex.value];
                          cartController.incrementQuantity(
                              foodItem.id, currentSize);
                        },
                        icon: const Icon(Icons.add_circle_outline),
                        iconSize: 18,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
