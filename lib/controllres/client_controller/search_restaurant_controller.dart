import 'package:get/get.dart';

class SearchRestaurantController extends GetxController {
  // Initial list of restaurants
  var restaurantList = [
    {
      'name': 'Hungry\'s Kitchen & Tap',
      'address': '2715 Ash Dr. San Jose',
      'location': 'Location 1',
      'hours': 'Ouvert de 08h à minuit',
      'imagePath': 'assets/images/restaurant1.png',
      'isOpen': true,
    },
    {
      'name': 'My Dung',
      'address': '3517 W. Gray St. Utica',
      'location': 'Location 6',
      'hours': 'Ouvert de 08h à minuit',
      'imagePath': 'assets/images/restaurant2.png',
      'isOpen': true,
    },
    {
      'name': 'Fog Harbor Fish House',
      'address': '8502 Preston Rd. Inglewood',
      'location': 'Location 4',
      'hours': 'Ouvert de 08h à minuit',
      'imagePath': 'assets/images/restaurant3.png',
      'isOpen': true,
    },
  ].obs; // Observable restaurant list

  var searchText = ''.obs; // Observable search text

  // Function to filter restaurant list based on search query
  List get filteredRestaurants {
    if (searchText.isEmpty) {
      return restaurantList;
    } else {
      return restaurantList
          .where((restaurant) => (restaurant['name'] as String?)
          ?.toLowerCase()
          .contains(searchText.value.toLowerCase()) ?? false)
          .toList();
    }
  }

  // Update search text
  void updateSearch(String value) {
    searchText.value = value;
  }
}
