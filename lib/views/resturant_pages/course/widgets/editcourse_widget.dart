
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:http/http.dart' as http;
import '../../../../config/app_constants.dart';
import 'package:google_places_flutter/model/place_details.dart';

class EditDestinationScreen extends StatefulWidget {
  final String destination;

  const EditDestinationScreen({
    super.key,
    required this.destination,
  });

  @override
  State<EditDestinationScreen> createState() => _EditDestinationScreenState();
}

class _EditDestinationScreenState extends State<EditDestinationScreen> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  LatLng _initialPosition = const LatLng(37.42796133580664, -122.085749655962); // Default location
  final Set<Marker> _markers = {};
  final TextEditingController _searchController = TextEditingController();
  final String _mapApiKey = 'AIzaSyA8j_Hab8mCZnw7TeMfp2B8opjHyLgmaGU';
  final List<Map<String, dynamic>> _selectedLocations = []; // List to store selected locations with address

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  // Function to get the user's current location
  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return; // Location services are not enabled, exit the function
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return; // Permissions are permanently denied
      }
    }

    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);
      _markers.add(
        Marker(
          markerId: const MarkerId('currentLocation'),
          position: _initialPosition,
          infoWindow: const InfoWindow(title: 'Your Location'),
        ),
      );
    });

    // Move the map camera to the user's current location
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: _initialPosition,
        zoom: 14.4746,
      ),
    ));
  }

  // Reverse Geocode the LatLng to get the address
  Future<String?> _getAddressFromLatLng(LatLng position) async {
    final String url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$_mapApiKey';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body);
        if (decodedData['status'] == 'OK' && decodedData['results'].isNotEmpty) {
          return decodedData['results'][0]['formatted_address'];
        }
      }
    } catch (e) {
      print('Error occurred while getting address: $e');
    }

    return null;
  }

  // Move the map camera to a specified location
  Future<void> _goToLocation(LatLng target) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: target,
        zoom: 14.4746,
      ),
    ));

    // Add a marker to the new searched location and update the selected locations list
    String? address = await _getAddressFromLatLng(target);
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(target.toString()),
          position: target,
          infoWindow: InfoWindow(title: address ?? 'Selected Location'),
        ),
      );
      if (address != null) {
        _selectedLocations.add({
          'position': target,
          'address': address,
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController destinationController = TextEditingController(text: widget.destination);

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 120),

                // Search Bar using google_places_flutter package
                GooglePlaceAutoCompleteTextField(
                  textEditingController: _searchController,
                  googleAPIKey: _mapApiKey,
                  inputDecoration: InputDecoration(
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
                  debounceTime: 800, // Delay between API requests
                  countries: null, // Restrict search to specific countries (optional)
                  isLatLngRequired: true, // Get LatLng for the selected location
                  getPlaceDetailWithLatLng: (Prediction prediction) {
                    _onSearchSelect(prediction); // Fetch place details when LatLng is required
                  },
                  itemClick: (Prediction prediction) {
                    _onSearchSelect(prediction); // Handle the item click
                    _searchController.text = prediction.description ?? ''; // Update search bar with the selected place's name
                  },
                ),

                const SizedBox(height: 20),

                // Map Section (GoogleMap Widget) with fixed size
                SizedBox(
                  height: 300, // Fixed height for the map
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: CameraPosition(
                        target: _initialPosition,
                        zoom: 14.4746,
                      ),
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                      markers: _markers,
                      onTap: (LatLng latLng) {
                        _addMarker(latLng); // Add marker on map tap
                      },
                      myLocationEnabled: true, // Enable current location
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Cards for each selected location (with address)
                if (_selectedLocations.isNotEmpty)
                  Expanded(
                    child: ListView.builder(
                      itemCount: _selectedLocations.length,
                      itemBuilder: (context, index) {
                        final location = _selectedLocations[index];
                        return Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            leading: SvgPicture.string(AppConstants.locationIcon),
                            title: Text(
                              location['address'], // Show the address
                              style: GoogleFonts.itim(fontSize: 16),
                            ),
                            trailing: SvgPicture.string(AppConstants.editIcon),
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),

          // Close button at the top left
          Positioned(
            top: 35,
            left: 16,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context); // Close the screen
              },
              child: const Icon(Icons.arrow_back, size: 30),
            ),
          ),
        ],
      ),
    );
  }

  void _onSearchSelect(Prediction? prediction) async {
    if (prediction == null || prediction.placeId == null) {
      print('Prediction or Place ID is null');
      return;
    }

    final String placeId = prediction.placeId!;
    final String url = 'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$_mapApiKey';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final placeDetails = json.decode(response.body);

        if (placeDetails['status'] == 'OK') {
          final location = placeDetails['result']['geometry']['location'];
          final LatLng selectedLocation = LatLng(
            location['lat'], // Extract latitude
            location['lng'], // Extract longitude
          );

          // Move the map to the selected location
          _goToLocation(selectedLocation);
        } else {
          print('Error: ${placeDetails['status']}');
        }
      } else {
        print('Failed to fetch place details: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred while fetching place details: $e');
    }
  }

  // Add marker to the map when the user taps on the map
  void _addMarker(LatLng position) async {
    String? address = await _getAddressFromLatLng(position); // Get the address from the tapped position

    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(position.toString()),
          position: position,
          infoWindow: InfoWindow(title: address ?? 'Selected Location'),
        ),
      );
      if (address != null) {
        _selectedLocations.add({
          'position': position,
          'address': address,
        });
      }
    });
  }
}

