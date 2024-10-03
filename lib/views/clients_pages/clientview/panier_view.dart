import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grup/views/clients_pages/clientview/widgets/mapsdisplay_widget.dart';
import 'package:grup/views/clients_pages/clientview/widgets/planifier_widget.dart';
import '../../../config/app_constants.dart';
import '../../../controllres/client_controller/order_controller.dart'; // Import the OrderController

class PanierView extends StatelessWidget {
  final OrderController orderController = Get.put<OrderController>(OrderController());

  PanierView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Panier",
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
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
                    // Open the dialog when an order is tapped
                    _showPanierConfirmationDialog(context, order.totalPrice);
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: const Icon(Icons.emoji_food_beverage_outlined),
                      title: Text(order.restaurantName),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Address: ${order.address}"),
                          Text("Total Price: \$${order.totalPrice.toStringAsFixed(2)}"),
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

  void _showPanierConfirmationDialog(BuildContext context, double? totalPrice) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PanierConfirmationDialog(totalPrice: totalPrice); // Use a StatefulWidget for the dialog
      },
    );
  }
}

class PanierConfirmationDialog extends StatefulWidget {
  final double? totalPrice;

  PanierConfirmationDialog({super.key, required this.totalPrice});

  @override
  _PanierConfirmationDialogState createState() => _PanierConfirmationDialogState();
}

class _PanierConfirmationDialogState extends State<PanierConfirmationDialog> {
  int _currentPage = 0; // To manage which page is currently displayed

  // Function to handle card taps and update the current page
  void _onCardTap(int pageIndex) {
    setState(() {
      _currentPage = pageIndex; // Set the new page index when a card is tapped
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Dialog(
          insetPadding: const EdgeInsets.only(top: 100), // This adds space at the top
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)), // Custom rounded corners
          ),
          child: Column(
            children: [
              // Show back and cancel icons when a card is tapped (not on the main page)
              if (_currentPage != 0)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          setState(() {
                            _currentPage = 0; // Go back to the main page
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.cancel),
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                      ),
                    ],
                  ),
                ),
              Expanded(
                child: _currentPage == 0
                    ? CustomPanierDetails(
                  totalePrice: widget.totalPrice,
                  onCardTap: _onCardTap, // Pass the callback to handle card taps
                )
                    : CenteredTitlePage(pageIndex: _currentPage),
              ),
            ],
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.05,
          left: 0,
          right: 0,
          child: const CircleAvatar(
            radius: 60,
            backgroundColor: Colors.yellow,
            child: Center(
              child: Icon(Icons.emoji_food_beverage_outlined),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomPanierDetails extends StatelessWidget {
  final double? totalePrice;
  final Function(int) onCardTap; // A callback to handle card taps

  CustomPanierDetails({super.key, required this.totalePrice, required this.onCardTap});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
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
        const SizedBox(height: 10),
        Card(
          margin: const EdgeInsets.all(8),
          child: ListTile(
            leading: SvgPicture.string(AppConstants.locationFill),
            title: Text('Votre Position actuelle'),
            onTap: () {
              onCardTap(1); // Switch to the first page
            },
          ),
        ),
        Card(
          margin: const EdgeInsets.all(8),
          child: ListTile(
            leading: SvgPicture.string(AppConstants.locationEmpty),
            title: Text('Autre adresse'),
            onTap: () {
              onCardTap(2); // Switch to the second page
            },
          ),
        ),
        Card(
          margin: const EdgeInsets.all(8),
          child: ListTile(
            leading: SvgPicture.string(AppConstants.lavraisonIcon),
            title: Text('Livraison standard'),
            subtitle: Text('Entre 20 & 40 min'),
            onTap: () {
              onCardTap(3); // Switch to the third page
            },
          ),
        ),
        Card(
          margin: const EdgeInsets.all(8),
          child: ListTile(
            leading: SvgPicture.string(AppConstants.planificationIcon),
            title: Text('Planifier'),
            subtitle: Text('Sélectionnez l\'heure qui vous convient'),
            onTap: () {
              onCardTap(4); // Switch to the fourth page
            },
          ),
        ),
        const Spacer(),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Action for validation
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                textStyle: const TextStyle(fontSize: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // Adjust the radius for more or less rounding
                ),
              ),
              child: Text(
                'Validez : \$${totalePrice!.toStringAsFixed(2)}',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CenteredTitlePage extends StatelessWidget {
  final int pageIndex;

  const CenteredTitlePage({super.key, required this.pageIndex});

  @override
  Widget build(BuildContext context) {
    String title = '';
    Widget? widgetView;

    switch (pageIndex) {
    case 1:
    title = 'Votre Position actuelle';
    widgetView = MapAddressScreen();
    break;
    case 2:
    title = 'Autre adresse';
    widgetView = MapAddressScreen();
    break;
    case 3:
      title = 'Livraison standard';
      break;
    case 4:
      title = 'Planifier';
      widgetView = PlanifierScreen();
      break;

    }

    return Center(
      child: widgetView,
    );
  }
}


