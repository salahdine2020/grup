import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_switch/flutter_switch.dart'; // Import the flutter_switch package

class BlurScreen extends StatefulWidget {
  const BlurScreen({super.key});

  @override
  _BlurScreenState createState() => _BlurScreenState();
}

class _BlurScreenState extends State<BlurScreen> {
  bool isSwitched = false; // Track the switch state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Set the background to transparent
      body: Stack(
        children: [
          // Blur effect
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Apply blur effect
              child: Container(
                color: Colors.black.withOpacity(0.4), // Black overlay with opacity
              ),
            ),
          ),
          // Full-screen content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // First Text
                Text(
                  'Êtes vous bien sûr que',
                  style: GoogleFonts.itim(fontSize: 24, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'cette commande est prête',
                  style: GoogleFonts.itim(fontSize: 24, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30), // Add spacing between texts
                // Second Text
                Text(
                  'Voulez vous lancer',
                  style: GoogleFonts.itim(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'une course à la validation',
                  style: GoogleFonts.itim(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'de cette commande ?',
                  style: GoogleFonts.itim(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                // Switch with text inside using flutter_switch
                FlutterSwitch(
                  width: 100.0,
                  height: 40.0,
                  valueFontSize: 18.0,
                  toggleSize: 25.0,
                  value: isSwitched,
                  borderRadius: 30.0,
                  padding: 8.0,
                  activeText: 'OUI',
                  inactiveText: 'NON',
                  showOnOff: true, // Text will be displayed inside the switch
                  activeColor: Colors.green,
                  inactiveColor: Colors.red,
                  onToggle: (val) {
                    setState(() {
                      isSwitched = val;
                    });
                  },
                ),
                SizedBox(height: 30), // Add spacing between switch and icons
                // Bottom buttons (Checkmark and Cross)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Checkmark button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the modal
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16), // Increase width
                        backgroundColor: Colors.white, // White background
                      ),
                      child: Icon(Icons.check, size: 24, color: Colors.black),
                    ),
                    SizedBox(width: 40), // Spacing between buttons
                    // Cross button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the modal
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16), // Increase width
                        backgroundColor: Colors.red, // Red background
                      ),
                      child: Icon(Icons.close, size: 24, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
