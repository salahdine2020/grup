import 'dart:ui'; // Required for the blur effect
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grup/views/clients_pages/resturant_card/widgets/resturantcard_widget.dart';
import '../../../controllres/client_controller/carte_controller.dart';
import '../../../models/client_models/fooditems_model.dart';

class CardToOrderScreen extends StatefulWidget {
  CardToOrderScreen({super.key});

  @override
  State<CardToOrderScreen> createState() => _CardToOrderScreenState();
}

class _CardToOrderScreenState extends State<CardToOrderScreen> {
  final CartController cartController = Get.put(CartController());

  @override
  void initState() {
    super.initState();
    cartController.addItem(
      FoodItem(
        id: 1,
        name: 'Marguerita',
        imageUrl: 'assets/images/marguireta.png',
        priceRange: '\$13.00 - \$15.00',
      ),
    );
    cartController.addItem(
      FoodItem(
        id: 2,
        name: 'Portuguesa',
        imageUrl: 'assets/images/pourguesa.png',
        priceRange: '\$8.00 - \$11.00',
      ),
    );
    cartController.addItem(
      FoodItem(
        id: 3,
        name: 'Calabresa',
        imageUrl: 'assets/images/calabresa.png',
        priceRange: '\$23.00 - \$25.00',
      ),
    );
  }

  @override
  void dispose() {
    cartController.clearAllItem();
    super.dispose();
  }

  double calculateTotalPrice() {
    double totalPrice = 0.0;

    for (var item in cartController.foodItems) {
      item.quantities.forEach((size, quantity) {
        double price = 0.0;
        if (size == 'S') price = 13.00;
        if (size == 'M') price = 14.00;
        if (size == 'L') price = 15.00;
        if (size == 'XL') price = 16.00;

        totalPrice += quantity.value * price;
      });
    }
    return totalPrice;
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Voulez-vous confirmer votre commande de : \$24.70',
                  style: GoogleFonts.itim(
                    textStyle: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        height: 18 / 15,
                        color: Colors.white,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center the buttons and keep them close
                children: [
                  SizedBox(
                    width: 140, // Set the width of the button to 80
                    child: ElevatedButton(
                      onPressed: () {
                        // Add confirmation logic here
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // Small corner rounding for a rectangular shape
                        ),
                      ),
                      child: const Icon(Icons.check, color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 18), // Spacing between the buttons
                  SizedBox(
                    width: 140, // Set the width of the button to 80
                    child: ElevatedButton(
                      onPressed: () {
                        // Add cancel logic here
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // Background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // Small corner rounding for a rectangular shape
                        ),
                      ),
                      child: const Icon(Icons.close, color: Colors.white),
                    ),
                  ),
                ],
              ),

            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 68),
              child: Column(
                children: [
                  const Text(
                    "Hungry's Kitchen & Tap",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 4),
                        child: const Text(
                          "Ouvert",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          // Implement call functionality
                        },
                        icon: const Icon(Icons.phone),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Appeler",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: cartController.foodItems.length,
                    itemBuilder: (context, index) {
                      return RestaurantCardWidget(
                        foodItem: cartController.foodItems[index],
                      );
                    },
                  )),
            ),
          ],
        ),
      ),
      floatingActionButton: Obx(() => SizedBox(
            width: MediaQuery.of(context).size.width * .922,
            child: FloatingActionButton.extended(
              onPressed: _showConfirmationDialog,
              backgroundColor: Colors.black,
              label: Text(
                'Total: \$${calculateTotalPrice().toStringAsFixed(2)}',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          )),
    );
  }
}
