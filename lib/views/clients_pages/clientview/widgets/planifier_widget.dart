import 'package:flutter/material.dart';

class PlanifierScreen extends StatefulWidget {
  @override
  _PlanifierScreenState createState() => _PlanifierScreenState();
}

class _PlanifierScreenState extends State<PlanifierScreen> {
  // This list will contain selected slots
  List<int> selectedSlots = [];

  // Sample data for time slots (use any data you like)
  final List<String> timeSlots = [
    '09/11/2022 15:00',
    '09/11/2022 15:30',
    '09/11/2022 16:00',
    '09/11/2022 16:30',
    '09/11/2022 17:00',
    '09/11/2022 17:30',
    '09/11/2022 18:00',
    '09/11/2022 18:30',
    '09/11/2022 19:00',
    '09/11/2022 19:30',
    '09/11/2022 20:00',
    '09/11/2022 20:30',
    '09/11/2022 21:00',
    '09/11/2022 21:30',
    '09/11/2022 22:00',
  ];

  // Function to toggle selection of a slot
  void toggleSlot(int index) {
    setState(() {
      if (selectedSlots.contains(index)) {
        selectedSlots.remove(index);
      } else {
        selectedSlots.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: screenWidth < 400 ? 2 : 3, // Adjusts based on screen width
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 2, // Adjusts the height of the cards
          ),
          itemCount: timeSlots.length,
          itemBuilder: (context, index) {
            final isSelected = selectedSlots.contains(index);
            return GestureDetector(
              onTap: () => toggleSlot(index), // Handle slot selection
              child: Card(
                color: isSelected ? Colors.grey : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: isSelected ? Colors.grey : Colors.black,
                    width: 2,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.access_time, color: isSelected ? Colors.black : Colors.black),
                    const SizedBox(height: 8),
                    Flexible(
                      child: Text(
                        timeSlots[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color:  Colors.black,
                          fontSize: 14, // Adjust font size for better fit
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
