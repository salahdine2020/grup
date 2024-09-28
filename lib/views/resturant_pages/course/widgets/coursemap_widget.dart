//
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../../../config/app_constants.dart';
//
// class CourseMapDetailScreen extends StatelessWidget {
//   final String orderId;
//   final String deliveryPhone;
//   final String departure;
//   final String destination;
//
//   const CourseMapDetailScreen({
//     Key? key,
//     required this.orderId,
//     required this.deliveryPhone,
//     required this.departure,
//     required this.destination,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Main content of the screen
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: Column(
//               children: [
//                 SizedBox(height: 140), // Space for the yellow circle
//                 // Map Section (Placeholder for Google Maps or Image)
//                 Card(
//                   elevation: 3,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Container(
//                     height: 200,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Image.asset(
//                       "assets/images/map_placeholder.png", // Replace with your map image
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//
//                 // Departure Section
//                 Card(
//                   elevation: 3,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(12),
//                     child: Row(
//                       children: [
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(10),
//                           child: Image.asset(
//                             "assets/images/burgerking.png", // Replace with appropriate image
//                             width: 40,
//                             height: 40,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         const SizedBox(width: 12),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Départ',
//                                 style: GoogleFonts.itim(fontSize: 18, fontWeight: FontWeight.bold),
//                               ),
//                               const SizedBox(height: 5),
//                               Text(
//                                 departure,
//                                 style: GoogleFonts.itim(fontSize: 16, color: Colors.grey),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//
//                 // Destination Section
//                 Card(
//                   elevation: 3,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(12),
//                     child: Row(
//                       children: [
//                         //const Icon(Icons.location_pin, size: 30, color: Colors.black),
//                         SvgPicture.string(AppConstants.locationIcon),
//                         const SizedBox(width: 12),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Destination',
//                                 style: GoogleFonts.itim(fontSize: 18, fontWeight: FontWeight.bold),
//                               ),
//                               const SizedBox(height: 5),
//                               Text(
//                                 destination,
//                                 style: GoogleFonts.itim(fontSize: 16, color: Colors.grey),
//                               ),
//                             ],
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             // Handle destination edit
//                           },
//                           child: const Icon(Icons.edit, size: 24, color: Colors.black),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const Spacer(),
//
//                 // Bottom Buttons for "Validez la demande" and "Annulez"
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {
//                         // Handle "Validez la demande"
//                       },
//                       style: ElevatedButton.styleFrom(
//                         padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
//                         backgroundColor: Colors.blue,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       child: Column(
//                         children: [
//                           SvgPicture.string(AppConstants.readyIconSvg, height: 24, width: 24),
//                           const SizedBox(height: 8),
//                           Text(
//                             'Validez la \n demande',
//                             textAlign: TextAlign.center,
//                             style: GoogleFonts.itim(fontSize: 16, color: Colors.white),
//                           ),
//                         ],
//                       ),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         // Handle "Annulez"
//                       },
//                       style: ElevatedButton.styleFrom(
//                         padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
//                         backgroundColor: Colors.red,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       child: Column(
//                         children: [
//                           SvgPicture.string(AppConstants.cancelIconSvg, height: 24, width: 24),
//                           const SizedBox(height: 8),
//                           Text(
//                             'Annulez la \n commande',
//                             textAlign: TextAlign.center,
//                             style: GoogleFonts.itim(fontSize: 16, color: Colors.white),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//               ],
//             ),
//           ),
//           // Close button at the top right
//           Positioned(
//             top: 30,
//             right: 20,
//             child: GestureDetector(
//               onTap: () {
//                 Navigator.pop(context); // Close the screen
//               },
//               child: const Icon(Icons.close, size: 30),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../config/app_constants.dart';
import 'editcourse_widget.dart';

class CourseMapDetailScreen extends StatefulWidget {
  final String orderId;
  final String deliveryPhone;
  final String departure;
  String destination; // Make destination mutable for updating

  CourseMapDetailScreen({
    Key? key,
    required this.orderId,
    required this.deliveryPhone,
    required this.departure,
    required this.destination,
  }) : super(key: key);

  @override
  _CourseMapDetailScreenState createState() => _CourseMapDetailScreenState();
}

class _CourseMapDetailScreenState extends State<CourseMapDetailScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0); // Start at the first page
  }

  @override
  void dispose() {
    _pageController.dispose(); // Clean up the controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            //physics: NeverScrollableScrollPhysics(), // Disable swipe gestures
            children: [
              // First page (Main content)
              _buildMainContent(context),
              const EditDestinationScreen(destination: '09, Rue des casades - Tlemcen',),
            ],
          ),
          // Close button at the top right
          Positioned(
            top: 30,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context); // Close the screen
              },
              child: const Icon(Icons.close, size: 30),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(height: 140), // Space for the yellow circle
          // Map Section (Placeholder for Google Maps or Image)
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
                "assets/images/map_placeholder.png", // Replace with your map image
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Departure Section
          _buildDepartureSection(),
          const SizedBox(height: 10),
          // Destination Section with edit button
          _buildDestinationSection(context),
          const Spacer(),
          // Bottom buttons for "Validez la demande" and "Annulez"
          _buildBottomButtons(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildDepartureSection() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/images/burgerking.png", // Replace with appropriate image
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Départ',
                    style: GoogleFonts.itim(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.departure,
                    style: GoogleFonts.itim(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDestinationSection(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            SvgPicture.string(AppConstants.locationIcon),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Destination',
                    style: GoogleFonts.itim(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.destination,
                    style: GoogleFonts.itim(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () async {
                _pageController.nextPage(duration: Duration(milliseconds: 30), curve: Curves.easeOut,);
                // Navigate to EditDestinationScreen and wait for result
                /*
                String? newDestination = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditDestinationScreen(
                      destination: widget.destination,
                    ),
                  ),
                );

                if (newDestination != null && newDestination.isNotEmpty) {
                  setState(() {
                    widget.destination = newDestination; // Update the destination
                  });
                }
                */
              },
              child: const Icon(Icons.edit, size: 24, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () {
            // Handle "Validez la demande"
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Column(
            children: [
              SvgPicture.string(AppConstants.readyIconSvg, height: 24, width: 24),
              const SizedBox(height: 8),
              Text(
                'Validez la \n demande',
                textAlign: TextAlign.center,
                style: GoogleFonts.itim(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Handle "Annulez"
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Column(
            children: [
              SvgPicture.string(AppConstants.cancelIconSvg, height: 24, width: 24),
              const SizedBox(height: 8),
              Text(
                'Annulez la \n commande',
                textAlign: TextAlign.center,
                style: GoogleFonts.itim(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
