import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../controllres/client_controller/order_controller.dart'; // Import the OrderController

class CourseClientScreen extends StatelessWidget {
  final OrderController orderController = Get.put<OrderController>(OrderController());

  CourseClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //print("order.imageUrl ------> ${orderController.orders[0].imageUrl}");
    return Scaffold(
      appBar: AppBar(
        title: Text("Course", style: GoogleFonts.poppins(color: Colors.white, fontSize: 24),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          // Use Obx to rebuild the UI when the orders list changes
          if (orderController.orders.isEmpty) {
            return const Center(
              child: Text("No orders available"),
            );
          } else {
            return ListView.builder(
              itemCount: orderController.orders.length,
              itemBuilder: (context, index) {
                final order = orderController.orders[index];
                return InkWell(
                  onTap: () {
                    // display a dialog
                    return _showConfirmationDialog(context, order.totalPrice);
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: const Icon(Icons
                          .emoji_food_beverage_outlined), //Image.asset(order.imageUrl, width: 50, height: 50),
                      title: Text(order.restaurantName),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Address: ${order.address}"),
                          Text(
                              "Total Price: \$${order.totalPrice.toStringAsFixed(2)}"),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        }),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context, double? totalPrice) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Stack(
          children: [
            const Dialog(
              insetPadding: EdgeInsets.only(top: 100), // This adds space at the top
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)), // Custom rounded corners
              ),
              child: CustomStepper(),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.05,
              left: 0,
              right: 0,
              child: const CircleAvatar(
                radius: 60,
                backgroundColor:
                    Colors.yellow, // Yellow background color for the circle
                child: Center(
                    child: Icon(Icons.emoji_food_beverage_outlined) //Image.asset(imagePath),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class CustomStepper extends StatelessWidget {
  const CustomStepper({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen size using MediaQuery
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
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
            verticalLine(height: screenHeight * 0.03, color: Colors.greenAccent), // Dynamic vertical space
            // First step - Active
            buildStepCircleWithLabel(
              color: Colors.greenAccent,
              step: "Préparation",
              screenWidth: screenWidth,
            ),
            verticalLine(height: screenHeight * 0.1, color: Colors.greenAccent), // Dynamic vertical space
            // Second step - Inactive
            buildStepCircleWithLabel(
              step: "Livraison",
              screenWidth: screenWidth,
              isRight: false,
            ),
            verticalLine(height: screenHeight * 0.1), // Dynamic vertical space
            // Third step - Inactive
            buildStepCircleWithLabel(
              step: "Réception",
              screenWidth: screenWidth,
            ),
            verticalLine(height: screenHeight * 0.015, ifEnd: true), // Dynamic vertical space
          ],
        ),
      ),
    );
  }

  Widget verticalLine({double height = 80, bool ifEnd = false, Color color = Colors.grey}) {
    return Column(
      children: [
        Container(
          width: 2.0,
          height: height,
          color: color,
        ),
        if (ifEnd)
          Container(
            width: 12.0,
            height: height,
            decoration: const BoxDecoration(
              color: Colors.grey, // Color for the end circle
              shape: BoxShape.circle,
            ),
          )
        else const SizedBox(),
      ],
    );
  }

  Widget buildStepCircleWithLabel({
    Color color = Colors.grey,
    bool isRight = true,
    String step = "",
    required double screenWidth, // Use screenWidth for dynamic sizing
  }) {
    final double circleSize = screenWidth * 0.13; // Adjust size relative to screen width
    final double textWidth = screenWidth * 0.6; // Adjust text width based on screen size

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        // Align the text left or right depending on 'isRight'
        if (!isRight) ...[
          SizedBox(
            height: 25,
            width: textWidth,
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                step,
                style: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(width: 8), // Small space between text and circle
        ],
        Container(
          width: circleSize, // Dynamic size for the circle
          height: circleSize,
          decoration: BoxDecoration(
            color: color, // Active/Inactive color
            shape: BoxShape.circle,
          ),
        ),
        if (isRight) ...[
          const SizedBox(width: 8), // Small space between circle and text
          SizedBox(
            height: 25,
            width: textWidth,
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                step,
                style: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
