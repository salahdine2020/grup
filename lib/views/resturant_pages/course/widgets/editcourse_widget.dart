import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../config/app_constants.dart';

class EditDestinationScreen extends StatelessWidget {
  final String destination;

  const EditDestinationScreen({
    super.key,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController destinationController = TextEditingController(text: destination);

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 120),

                // Search Bar
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Recherchez votre restaurant...',
                    hintStyle: GoogleFonts.itim(color: Colors.grey),
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                  ),
                ),
                const SizedBox(height: 20),

                // Map Section
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      "assets/images/map_placeholder.png", // Replace with actual map
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Editable Destination Section
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        SvgPicture.string(AppConstants.locationIcon), // Use your location icon
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 5),
                              Text(
                                destination,
                                style: GoogleFonts.itim(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Logic for updating the destination
                            destinationController.clear(); // Optional logic to clear text for new input
                          },
                          child: const Icon(Icons.edit, size: 24, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Close button at the top right
          Positioned(
            top: 35,
            left: 16,
            child: GestureDetector(
              onTap: () {

              },
              child: const Icon(Icons.arrow_back, size: 30),
            ),
          ),
        ],
      ),
    );
  }
}
