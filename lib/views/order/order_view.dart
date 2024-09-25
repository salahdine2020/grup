import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grup/views/order/widgets/order_widget.dart';
import '../../config/app_constants.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int _selectedIndex = 0;
  String _selectedStatus = 'En cours'; // Initialize with default status

  // Define the color mapping for each status
  final Map<String, Color> statusColors = {
    'En cours': Colors.yellow,
    'Prête': Colors.blue,
    'Livrée': Colors.lightGreenAccent,
    'Annulée': Colors.red,
  };

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onStatusChanged(String newStatus) {
    setState(() {
      _selectedStatus = newStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Define the views based on the selected index
    List<Widget> _views = [
      OrderScreenView(
        selectedStatus: _selectedStatus,
        onStatusChanged: _onStatusChanged,
        statusColors: statusColors,
      ),
      Container(),
      Container(),
      Container(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const SizedBox(),
        centerTitle: true,
      ),
      body: _views[_selectedIndex], // Display the appropriate view
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
        selectedLabelStyle: GoogleFonts.itim(
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            height: 18 / 15,
          ),
        ),
        unselectedLabelStyle: GoogleFonts.itim(
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            height: 18 / 15,
          ),
        ),
      ),
    );
  }
}

class OrderScreenView extends StatelessWidget {
  final String selectedStatus;
  final ValueChanged<String> onStatusChanged;
  final Map<String, Color> statusColors;

  const OrderScreenView({
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
              buildStatusTab('En cours', '5'),
              buildStatusTab('Prête', '2'),
              buildStatusTab('Livrée', '3'),
              buildStatusTab('Annulée', '3'),
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
          // Date Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildDateButton('Hier'),
              _buildDateButton('Aujourd\'hui', isSelected: true),
              _buildDateButton('Demain'),
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

  Widget _buildDateButton(String title, {bool isSelected = false}) {
    return Card(
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
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.itim(
            textStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              height: 18 / 15,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOrderCard(BuildContext context, String cmd, String title, String phone, String waitTime, String amount) {
    bool isEnCours = selectedStatus == 'En cours';
    bool isLivree = selectedStatus == 'Livrée';

    return Dismissible(
      key: Key(cmd),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) async {
        // Handle dismiss actions for different statuses
        if (isEnCours) {
          // Example: You can handle cancellation or mark as ready here.
          // Return true/false based on your logic.
        } else if (isLivree) {
          // Example: Handle course or delivery completion.
          // Return true/false based on your logic.
        }
        return false; // Disable actual dismiss unless implemented
      },
      background: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 48),
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: statusColors[selectedStatus], // Use the selected status color
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(18),
            bottomRight: Radius.circular(18),
            topLeft: Radius.circular(18),
            bottomLeft: Radius.circular(18),
          ),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (isEnCours) ...[
              GestureDetector(
                onTap: () {
                  print('Order $cmd cancelled.');
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.string(AppConstants.cancelIconSvg, height: 24, width: 24),
                    const SizedBox(height: 10),
                    Text('Annulez', style: GoogleFonts.itim(textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white))),
                  ],
                ),
              ),
              const SizedBox(width: 40),
              GestureDetector(
                onTap: () {
                  print('Order $cmd marked as ready.');
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.string(AppConstants.readyIconSvg, height: 24, width: 24),
                    const SizedBox(height: 10),
                    Text('Prête', style: GoogleFonts.itim(textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white))),
                  ],
                ),
              ),
            ] else if (isLivree) ...[
              GestureDetector(
                onTap: () {
                  print('Course action for $cmd.');
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.string(AppConstants.courseIconSvg, height: 24, width: 24),
                    const SizedBox(height: 10),
                    Text('Course', style: GoogleFonts.itim(textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white))),
                  ],
                ),
              ),
              const SizedBox(width: 40),
              GestureDetector(
                onTap: () {
                  print('Order $cmd marked as delivered.');
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.string(AppConstants.deliveredIconSvg, height: 24, width: 24),
                    const SizedBox(height: 10),
                    Text('Livrée', style: GoogleFonts.itim(textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white))),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
      child: InkWell(
        onTap: () {
          // Handle order details dialog
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
                      backgroundColor: Colors.yellow, // Yellow background color for the circle
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
                    color: statusColors[selectedStatus], // Use the selected status color
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
      ),
    );
  }
}
