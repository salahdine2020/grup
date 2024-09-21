import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../config/app_constants.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'En cours',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            // Order Status Tabs
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatusTab('En cours', '5', isSelected: true),
                _buildStatusTab('Prête', '2'),
                _buildStatusTab('Livrée', '3'),
                _buildStatusTab('Annulée', '3'),
              ],
            ),
            SizedBox(height: 20),

            // Search and Calendar
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      hintText: 'Recherchez sur une date',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                SvgPicture.string(
                  AppConstants.calendarSvg,  // Calendar SVG from app_constants
                  height: 40,
                  width: 40,
                ),
              ],
            ),
            SizedBox(height: 20),

            // Date Selection Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildDateButton('Hier'),
                _buildDateButton('Aujourd\'hui', isSelected: true),
                _buildDateButton('Demain'),
              ],
            ),
            SizedBox(height: 20),

            // List of Orders
            Expanded(
              child: ListView(
                children: [
                  _buildOrderCard('CMD : 001', 'Livraison à domicile', '0 551 36 62 21', '5 minutes', '£ 15.20'),
                  _buildOrderCard('CMD : 002', 'Commande à table', 'Table : 02', '5 minutes', '£ 15.20'),
                  _buildOrderCard('CMD : 003', 'Livraison à domicile', '0 551 36 62 21', '5 minutes', '£ 15.20'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildStatusTab(String title, String count, {bool isSelected = false}) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? AppConstants.primaryColor : Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: isSelected
                ? [BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 4))]
                : [],
          ),
          child: Text(
            '$title\n$count',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateButton(String title, {bool isSelected = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: isSelected
            ? [BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 4))]
            : [],
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildOrderCard(String cmd, String title, String phone, String waitTime, String amount) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Order Circle
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: AppConstants.primaryColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  cmd,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(width: 16),

            // Order Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    phone,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Attente : $waitTime',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Montant : $amount',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),

            // Call Button
            SvgPicture.string(
              '''<SVG_STRING_FOR_CALL_ICON>''',  // Placeholder for the call icon
              height: 24,
              width: 24,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.string(AppConstants.ordersIconSvg),
          label: 'Commandes',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.string(AppConstants.deliveryIconSvg),
          label: 'Course',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.string(AppConstants.menuIconSvg),
          label: 'Menus',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.string(AppConstants.accountIconSvg),
          label: 'Compte',
        ),
      ],
      selectedItemColor: AppConstants.primaryColor,
      unselectedItemColor: Colors.black,
    );
  }
}
