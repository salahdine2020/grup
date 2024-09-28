
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/app_constants.dart';
import 'blureconfirm_widget.dart';

class OrderDetailScreen extends StatelessWidget {
  final String orderId;
  final String deliveryPhone;
  final String itemName;
  final String itemPrice;
  final String drinkName;
  final String drinkPrice;

  const OrderDetailScreen({
    Key? key,
    required this.orderId,
    required this.deliveryPhone,
    required this.itemName,
    required this.itemPrice,
    required this.drinkName,
    required this.drinkPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            // Main content of the screen
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: 80), // Space for the yellow circle
                  // Order Information
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Livraison : $deliveryPhone',
                        style: GoogleFonts.itim(
                          textStyle: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.string(AppConstants.phoneSvg, height: 20),
                          const SizedBox(width: 5),
                          Text(
                            'Appeler',
                            style: GoogleFonts.itim(
                              textStyle: const TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
        
                  // Order Items
                  _buildOrderItem(itemName, itemPrice, "assets/images/pizza.png"),
                  _buildOrderItem(drinkName, drinkPrice, "assets/images/water.png"),
        
                  const Spacer(),
        
                  // Ready and Cancel Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Handle order ready action
                          showGeneralDialog(
                            context: context,
                            barrierDismissible: true,
                            barrierLabel: 'BlurScreen',
                            pageBuilder: (context, animation1, animation2) {
                              return const BlurScreen();
                            },
                            transitionBuilder: (context, animation1, animation2, child) {
                              return FadeTransition(
                                opacity: animation1,
                                child: child,
                              );
                            },
                            transitionDuration: const Duration(milliseconds: 300),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10), // Adjust as necessary
                          ),
                          child: Column(
                            children: [
                              SvgPicture.string(
                                AppConstants.cancelIconSvg, // Placeholder for cancel icon
                                height: 24,
                                width: 24,
                              ),
                              SizedBox(height: 18),
                              Text(
                                'Commande \n Prête',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.itim(fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Handle cancel order action
                          showGeneralDialog(
                            context: context,
                            barrierDismissible: true,
                            barrierLabel: 'BlurScreen',
                            pageBuilder: (context, animation1, animation2) {
                              return const BlurScreen();
                            },
                            transitionBuilder: (context, animation1, animation2, child) {
                              return FadeTransition(
                                opacity: animation1,
                                child: child,
                              );
                            },
                            transitionDuration: const Duration(milliseconds: 300),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10), // Adjust as necessary
                          ),
                          child: Column(
                            children: [
                              SvgPicture.string(
                                AppConstants.readyIconSvg, // Placeholder for ready icon
                                height: 24,
                                width: 24,
                              ),
                              SizedBox(height: 18),
                              Text(
                                'Annulez la \n commande',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.itim(fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Yellow Circular Container at the Top
            // Positioned(
            //   top: 0,
            //   left: MediaQuery.of(context).size.width * 0.38, // Adjust positioning
            //   child: CircleAvatar(
            //     radius: 50,
            //     backgroundColor: Colors.yellow, // Yellow background color for the circle
            //     child: Center(
            //       child: Text(
            //         '$orderId',
            //         textAlign: TextAlign.center,
            //         style: const TextStyle(
            //           fontSize: 16,
            //           fontWeight: FontWeight.bold,
            //           color: Colors.black,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // Close button at the top right
            Positioned(
              top: 10,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Close the screen
                },
                child: Icon(Icons.close, size: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderItem(String name, String price, String image) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Rounded corners for the card
      ),
      child: Padding(
        padding: const EdgeInsets.all(10), // Padding to give space inside the card
        child: Row(
          children: [
            // Image for the item
            ClipRRect(
              borderRadius: BorderRadius.circular(10), // Rounded corners for the image
              child: Image.asset(
                image,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 15), // Space between the image and text

            // Name and price
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.itim(fontSize: 18),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '\$$price',
                    style: GoogleFonts.itim(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),

            // Size and Quantity section with borders
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Size Box
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    'M', // Size value
                    style: GoogleFonts.itim(fontSize: 16),
                  ),
                ),
                SizedBox(height: 10),
                // Quantity Box
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    '1', // Quantity value
                    style: GoogleFonts.itim(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
