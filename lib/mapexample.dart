// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_places_flutter/google_places_flutter.dart';
// import 'package:google_places_flutter/model/prediction.dart';
//
// class MapSample extends StatefulWidget {
//   const MapSample({super.key});
//
//   @override
//   State<MapSample> createState() => MapSampleState();
// }
//
// class MapSampleState extends State<MapSample> {
//   final Completer<GoogleMapController> _controller =
//   Completer<GoogleMapController>();
//   final Set<Marker> _markers = {};
//   LatLng _initialPosition = const LatLng(37.42796133580664, -122.085749655962); // Default location
//   String _mapApiKey = 'YOUR_API_KEY'; // Add your Google Maps API key here
//   TextEditingController _searchController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//   }
//
//   // Function to get the user's current location
//   Future<void> _getCurrentLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//
//     // Check if location services are enabled
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return; // Location services are not enabled, exit the function
//     }
//
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.deniedForever) {
//         return; // Permissions are permanently denied
//       }
//     }
//
//     Position position = await Geolocator.getCurrentPosition();
//     setState(() {
//       _initialPosition = LatLng(position.latitude, position.longitude);
//     });
//
//     // Move the map camera to the user's current location
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(
//       CameraPosition(
//         target: _initialPosition,
//         zoom: 14.4746,
//       ),
//     ));
//   }
//
//   // Function to add markers to the map
//   void _addMarker(LatLng position) {
//     setState(() {
//       _markers.add(
//         Marker(
//           markerId: MarkerId(position.toString()),
//           position: position,
//         ),
//       );
//     });
//   }
//
//   // Function to search using Google Places API
//   void _onSearchSelect(Prediction prediction) async {
//     // Get the place details using the selected prediction
//     final placeId = prediction.placeId;
//     final description = prediction.description;
//
//     // You need to make a request to the Google Places Details API to get the LatLng of the selected place.
//     // Once you get the LatLng, you can update the map.
//
//     // For example:
//     LatLng searchedLocation = await _getLatLngFromPlaceId(placeId!);
//     _goToLocation(searchedLocation);
//   }
//
//   // Dummy function to demonstrate retrieving LatLng from placeId.
//   // You will need to replace this with an actual implementation that uses the Places Details API.
//   Future<LatLng> _getLatLngFromPlaceId(String placeId) async {
//     // Implement the API request to get LatLng
//     // For now, returning a default position
//     return LatLng(37.7749, -122.4194); // Example: San Francisco
//   }
//
//   // Move the map camera to a specified location
//   Future<void> _goToLocation(LatLng target) async {
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(
//       CameraPosition(
//         target: target,
//         zoom: 14.4746,
//       ),
//     ));
//     _addMarker(target); // Optionally, add a marker at the searched location
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Google Map with Search and Save'),
//         backgroundColor: Colors.blue,
//       ),
//       body: Stack(
//         children: [
//           GoogleMap(
//             mapType: MapType.normal,
//             initialCameraPosition: CameraPosition(
//               target: _initialPosition,
//               zoom: 14.4746,
//             ),
//             onMapCreated: (GoogleMapController controller) {
//               _controller.complete(controller);
//             },
//             markers: _markers,
//             onTap: (LatLng latLng) {
//               _addMarker(latLng);
//             },
//             myLocationEnabled: true, // Enable user's current location on the map
//           ),
//           Positioned(
//             top: 10,
//             left: 10,
//             right: 10,
//             child: Column(
//               children: [
//                 TextField(
//                   controller: _searchController,
//                   decoration: InputDecoration(
//                     hintText: 'Search Location',
//                     filled: true,
//                     fillColor: Colors.white,
//                     prefixIcon: Icon(Icons.search),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                   onChanged: (value) {
//                     // AutoComplete widget integration
//                   },
//                 ),
//                 GooglePlaceAutoCompleteTextField(
//                   textEditingController: _searchController,
//                   googleAPIKey: _mapApiKey,
//                   debounceTime: 800, // 800ms debounce for API requests
//                   countries: const ['us'], // Restrict search to certain countries
//                   isLatLngRequired: true,
//                   getPlaceDetailWithLatLng: (Prediction prediction) {
//                     _onSearchSelect(prediction);
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Save the marker positions or perform other actions
//         },
//         child: const Icon(Icons.save),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(const MyAppMap());
// }
//
// class MyAppMap extends StatelessWidget {
//   const MyAppMap({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: const MapSample(),
//     );
//   }
// }
