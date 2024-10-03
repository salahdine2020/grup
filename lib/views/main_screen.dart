import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grup/views/resturant_pages/compte/compte_view.dart';
import 'package:grup/views/resturant_pages/course/course_view.dart';
import 'package:grup/views/resturant_pages/menu/menu_view.dart';
import 'package:grup/views/resturant_pages/order/order_view.dart';
import '../../config/app_constants.dart';
import '../controllres/resturant_controller/bottom_nav_controller.dart';
import '../controllres/resturant_controller/main_screen_controller.dart';

class MainScreen extends StatelessWidget {
  final BottomNavController navController = Get.put(BottomNavController());
  final MainScreenController mainScreenController = Get.find<MainScreenController>();


  final List<Widget> pages = [
    OrderView(),
    CourseView(),
    MenuView(),
    CompteResturantView(),
  ];

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: pages[navController.currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: navController.currentIndex.value,
          onTap: (index) {
            navController.changeTabIndex(index);
          },
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
    });
  }
}
