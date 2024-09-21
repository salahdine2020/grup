// lib/views/home/home_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllres/home_controller.dart';
import 'widgets/restaurant_card.dart';

class HomeView extends StatelessWidget {
  final HomeController _homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'.tr),
      ),
      body: Obx(() {
        if (_homeController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (_homeController.restaurants.isEmpty) {
          return Center(child: Text('No restaurants available.'));
        } else {
          return ListView.builder(
            itemCount: _homeController.restaurants.length,
            itemBuilder: (context, index) {
              return RestaurantCard(restaurant: _homeController.restaurants[index]);
            },
          );
        }
      }),
    );
  }
}
