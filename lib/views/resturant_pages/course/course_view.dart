import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grup/views/resturant_pages/course/widgets/coursemap_widget.dart';
import '../../../config/app_constants.dart';
import '../order/widgets/order_widget.dart';

class CourseView extends StatefulWidget {
  const CourseView({super.key});

  @override
  _CourseViewState createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  String _selectedStatus = 'Demande'; // Initialize with default status

  // Define the color mapping for each status
  final Map<String, Color> statusColors = {
    'Demande': Colors.yellow,
    'Acceptee': Colors.blue,
    'Annulee': Colors.red,
    'Livree': Colors.lightGreenAccent,
  };

  void _onStatusChanged(String newStatus) {
    setState(() {
      _selectedStatus = newStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const SizedBox(),
        centerTitle: true,
      ),
      body: CourseViewContent(
        selectedStatus: _selectedStatus,
        onStatusChanged: _onStatusChanged,
        statusColors: statusColors,
      ),
    );
  }
}

class CourseViewContent extends StatelessWidget {
  final String selectedStatus;
  final ValueChanged<String> onStatusChanged;
  final Map<String, Color> statusColors;

  const CourseViewContent({
    super.key,
    required this.selectedStatus,
    required this.onStatusChanged,
    required this.statusColors,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          // Status Tabs
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildStatusTab('Demande', '5'),
              buildStatusTab('Acceptee', '2'),
              buildStatusTab('Annulee', '3'),
              buildStatusTab('Livree', '3'),
            ],
          ),
          const SizedBox(height: 20),
          // Search bar and calendar
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: 'Recherchez sur une date',
                    hintStyle: GoogleFonts.itim(
                      textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        height: 18 / 15,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              SvgPicture.string(
                AppConstants.calendarSvg,
                height: 40,
                width: 40,
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Single "Ajoute" Button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildDateButton(context, 'Ajoute', isSelected: true),
            ],
          ),
          const SizedBox(height: 20),
          // Orders List
          Expanded(
            child: ListView(
              children: [
                _buildOrderCard(context, 'CMD : 001', 'Livraison à domicile', '0 551 36 62 21', '5 minutes', '£ 15.20'),
                _buildOrderCard(context, 'CMD : 002', 'Commande à table', 'Table : 02', '5 minutes', '£ 15.20'),
                _buildOrderCard(context, 'CMD : 003', 'Livraison à domicile', '0 551 36 62 21', '5 minutes', '£ 15.20'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildStatusTab(String title, String count) {
    bool isSelected = selectedStatus == title;
    return GestureDetector(
      onTap: () => onStatusChanged(title),
      child: Column(
        children: [
          Card(
            elevation: 6,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? statusColors[title] : Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: isSelected
                    ? [const BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 4))]
                    : [],
              ),
              child: Text(
                '$title\n$count',
                textAlign: TextAlign.center,
                style: GoogleFonts.itim(
                  textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    height: 18 / 15,
                    color: isSelected ? Colors.black : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateButton(BuildContext context, String title, {bool isSelected = false}) {
    return InkWell(
      onTap: (){
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Stack(
              children: [
                Dialog(
                  insetPadding: const EdgeInsets.only(top: 100), // This adds space at the top
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Custom rounded corners
                  ),
                  child: CourseMapDetailScreen(
                    orderId: "cmd",
                    deliveryPhone: "+21365559988",
                    departure: 'King Burger',
                    destination: '09, Rue des casades - Tlemcen',
                    //itemName: 'Marguerita',
                    //itemPrice: '\$13.00',
                    //drinkName: 'Water',
                    //drinkPrice: '\$11.70',
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.05,
                  left: 0,
                  right: 0,
                  child: const CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.yellow, // Yellow background color for the circle
                    child: Center(
                      child: Text(
                        "cmd",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Card(
        elevation: 5,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: isSelected
                ? [const BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 4))]
                : [],
          ),
          child: Row(
            children: [
              SvgPicture.string(AppConstants.addicon),
              const SizedBox(width: 12,),
              Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.itim(
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    height: 18 / 15,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderCard(BuildContext context, String cmd, String title, String phone, String waitTime, String amount) {
    return InkWell(
      onTap: () {
        // Handle order details dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Stack(
              children: [
                Dialog(
                  insetPadding: const EdgeInsets.only(top: 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: OrderDetailScreen(
                    orderId: cmd,
                    deliveryPhone: phone,
                    itemName: 'Marguerita',
                    itemPrice: '\$13.00',
                    drinkName: 'Water',
                    drinkPrice: '\$11.70',
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.05,
                  left: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.yellow,
                    child: Center(
                      child: Text(
                        cmd,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Order Circle
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: statusColors[selectedStatus],
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      cmd,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.itim(
                        textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400, height: 18 / 15, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Order Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.itim(textStyle: const TextStyle(fontSize: 25, fontWeight: FontWeight.w400, height: 18 / 15)),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      phone,
                      style: GoogleFonts.itim(
                        textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, height: 18 / 15, color: Colors.grey[700]),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Attente : $waitTime',
                      style: GoogleFonts.itim(
                        textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, height: 18 / 15, color: Colors.grey[600]),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Montant : $amount',
                      style: GoogleFonts.itim(
                        textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, height: 18 / 15, color: Colors.grey[600]),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 2),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(height: 98),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.string(AppConstants.phoneSvg, height: 24, width: 24),
                      const SizedBox(width: 8),
                      const Text("Appeler"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
