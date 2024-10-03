

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grup/config/app_constants.dart';
import 'package:grup/views/clients_pages/clientview/panier_view.dart';
import 'package:grup/views/resturant_pages/compte/compte_view.dart';
import '../resturant_card/resturant_card.dart';
import 'compte_view.dart';
import 'courseclient_view.dart';

class ClientView extends StatefulWidget {
  const ClientView({super.key});

  @override
  _ClientViewState createState() => _ClientViewState();
}

class _ClientViewState extends State<ClientView> {
  int _selectedIndex = 0; // Track the selected tab index

  // Define the different pages (views) for each bottom navigation item
  final List<Widget> _pages = [
    ClientHomeScreen(),  // The main home screen with restaurants
    CourseClientScreen(),      // Course screen that displays the order
    PanierView(),
    CompteView(),
  ];

  // This function is called when a bottom navigation item is tapped
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,  // Display the screen based on the selected index
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,  // Track the selected tab
        onTap: _onItemTapped,  // Update the selected index when a tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.string(
              AppConstants.homeSvgIcon, // Home SVG string
              height: 24,
              width: 24,
            ),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.string(
              AppConstants.courseSvgIcon, // Course SVG string
              height: 24,
              width: 24,
            ),
            label: 'Course',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.string(
              AppConstants.panierSvgIcon, // Panier SVG string
              height: 24,
              width: 24,
            ),
            label: 'Panier',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.string(
              AppConstants.compteSvgIcon, // Compte SVG string
              height: 24,
              width: 24,
            ),
            label: 'Compte',
          ),
        ],
      ),
    );
  }
}

// Home Screen Widget (this was previously inside ClientView)
class ClientHomeScreen extends StatefulWidget {
  const ClientHomeScreen({super.key});

  @override
  _ClientHomeScreenState createState() => _ClientHomeScreenState();
}

class _ClientHomeScreenState extends State<ClientHomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, dynamic>> _restaurants = [
    {
      'name': 'Hungry\'s Kitchen & Tap',
      'address': '2715 Ash Dr. San Jose',
      'location': 'Location 1',
      'hours': 'Ouvert de 08h à minuit',
      'imagePath': 'assets/images/restaurant1.png',
      'isOpen': true
    },
    {
      'name': 'My Dung',
      'address': '3517 W. Gray St. Utica',
      'location': 'Location 6',
      'hours': 'Ouvert de 08h à minuit',
      'imagePath': 'assets/images/restaurant2.png',
      'isOpen': true
    },
    {
      'name': 'Fog Harbor Fish House',
      'address': '8502 Preston Rd. Inglewood',
      'location': 'Location 4',
      'hours': 'Ouvert de 08h à minuit',
      'imagePath': 'assets/images/restaurant3.png',
      'isOpen': true
    },
  ];

  List<Map<String, dynamic>> _filteredRestaurants = [];

  @override
  void initState() {
    super.initState();
    _filteredRestaurants = _restaurants; // Start with all restaurants
    _searchController.addListener(_filterRestaurants); // Listen for changes in the search field
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterRestaurants() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredRestaurants = _restaurants.where((restaurant) {
        return restaurant['name'].toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 68.0, right: 12, left: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Field
          Container(
            margin: const EdgeInsets.only(bottom: 16.0),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Recherchez votre restaurant...',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                icon: Icon(Icons.search, color: Colors.black),
              ),
            ),
          ),

          // Horizontal List of Categories
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                categoryItem('Boisson', 'assets/images/boisson.png'),
                categoryItem('Fish', 'assets/images/fish.png'),
                categoryItem('Sandwich', 'assets/images/sandwich.png'),
                categoryItem('Hum', 'assets/images/hum.png'),
                categoryItem('Burger', 'assets/images/sandwich.png'),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Nearby Restaurants Text
          const Row(
            children: [
              Icon(Icons.location_pin, color: Colors.red),
              SizedBox(width: 8),
              Text(
                'Les restaurants autour de vous',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // List of Restaurants
          Expanded(
            child: ListView.builder(
              itemCount: _filteredRestaurants.length,
              itemBuilder: (context, index) {
                var restaurant = _filteredRestaurants[index];
                return restaurantCard(
                  restaurant['name'],
                  restaurant['address'],
                  restaurant['location'],
                  restaurant['hours'],
                  restaurant['imagePath'],
                  restaurant['isOpen'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Widget for Category Items
  Widget categoryItem(String name, String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(height: 8),
          Text(name, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  // Widget for Restaurant Card
  Widget restaurantCard(
      String name,
      String address,
      String location,
      String hours,
      String imagePath,
      bool isOpen,
      ) {
    return InkWell(
      onTap: (){
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Stack(
              children: [
                Dialog(
                  insetPadding: const EdgeInsets.only(top: 100), // This adds space at the top
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft:  Radius.circular(20)), // Custom rounded corners
                  ),
                  child: CardToOrderScreen(),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.05,
                  left: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.yellow, // Yellow background color for the circle
                    child: Center(
                      child: Image.asset(imagePath),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imagePath),
          ),
          title: Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(address),
              Text(location),
              Text(hours, style: const TextStyle(color: Colors.grey)),
            ],
          ),
          trailing: Container(
            decoration: BoxDecoration(
              color: isOpen ? Colors.green : Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              isOpen ? 'Ouvert' : 'Fermé',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
