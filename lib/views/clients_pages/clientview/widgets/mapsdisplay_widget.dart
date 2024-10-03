import 'package:flutter/material.dart';

class MapAddressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // List of addresses (just for demonstration)
    final List<Map<String, String>> addresses = [
      {'title': '20, Rue belle vue , Tlemcen'},
      {'title': '10, Rue Colonel Lotfi, Tlemcen'},
      {'title': '30, Avenue des arcades, Tlemcen'},
    ];

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 16),
          // Search bar with back and cancel icons
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                color: Colors.grey[200], // Background of the search bar
                borderRadius: BorderRadius.circular(20),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Recherchez votre restaurant...',
                  hintStyle: TextStyle(color: Colors.grey),
                  suffixIcon:
                  Icon(Icons.search, color: Colors.grey), // Search Icon
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Map section (replace with actual map widget if integrated)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[300], // Background color for the map placeholder
                borderRadius: BorderRadius.circular(15), // Rounded corners
              ),
              // Placeholder for map
              child: Image.network(
                'https://via.placeholder.com/400x200?text=Map+View',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // List of addresses wrapped in Dismissible
          Expanded(
            child: ListView.builder(
              itemCount: addresses.length,
              itemBuilder: (context, index) {
                final address = addresses[index]['title'];

                return Dismissible(
                  key: Key(address ?? ''),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15), // Rounded corners
                    ),
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          'Supprimer',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.delete, color: Colors.white),
                      ],
                    ),
                  ),
                  onDismissed: (direction) {
                    // Here you can add functionality to delete the address
                    addresses.removeAt(index);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('$address supprimé')),
                    );
                  },
                  child: Card(
                    child: ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text(address ?? ''),
                      trailing: Icon(Icons.edit),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
