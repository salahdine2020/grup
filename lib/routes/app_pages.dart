// lib/routes/app_pages.dart
import 'package:get/get.dart';
import 'package:grup/bindings/client_binding/client_binding.dart';
import 'package:grup/bindings/delivery_binding/delivery_binding.dart';
import 'package:grup/bindings/resturant_bindings/main_screen_binding.dart';
import 'package:grup/views/clients_pages/clientview/client_view.dart';
import 'package:grup/views/delivery_pages/delivery_view/delivery_view.dart';
import 'package:grup/views/main_screen.dart';
import '../bindings/client_binding/searchrestaurant_binding.dart';
import '../bindings/resturant_bindings/compte_binding.dart';
import '../bindings/resturant_bindings/course_binding.dart';
import '../bindings/resturant_bindings/home_binding.dart';
import '../bindings/resturant_bindings/auth_binding.dart';
import '../bindings/resturant_bindings/cart_binding.dart';
import '../bindings/resturant_bindings/menu_binding.dart';
import '../bindings/resturant_bindings/order_binding.dart';
import '../views/clients_pages/resturant_card/resturant_card.dart';
import '../views/resturant_pages/auth/login_view.dart';
import '../views/resturant_pages/auth/signup_view.dart';
import '../views/resturant_pages/cart/cart_view.dart';
import '../views/resturant_pages/cart/checkout_view.dart';
import '../views/resturant_pages/compte/compte_view.dart';
import '../views/resturant_pages/course/course_view.dart';
import '../views/resturant_pages/home/home_view.dart';
import '../views/resturant_pages/menu/menu_view.dart';
import '../views/resturant_pages/order/order_view.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => SignupView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.cart,
      page: () => CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: AppRoutes.checkout,
      page: () => CheckoutView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: AppRoutes.order,
      page: () => OrderView(),
      binding: OrderBinding(),
    ),
    // ----------------------------
    GetPage(
      name: AppRoutes.course,
      page: () => CourseView(),
      binding: CourseBinding(),
    ),
    GetPage(
      name: AppRoutes.menus,
      page: () => MenuView(),
      binding: MenuBinding(),
    ),
    GetPage(
      name: AppRoutes.compte,
      page: () => CompteResturantView(),
      binding: CompteBinding(),
    ),
    GetPage(
      name: AppRoutes.mainview,
      page: () => MainScreen(),
      binding: MainScreenBinding(),
    ),

    GetPage(
      name: AppRoutes.client,
      page: () => ClientView(),
      binding: ClientBinding(), //ClientBinding(), // SearchRestaurantBinding
    ),
    GetPage(
      name: AppRoutes.delivery,
      page: () => const DeliveryView(),
      binding: DeliveryBinding(),
    ),
    GetPage(
      name: AppRoutes.cardOrder,
      page: () => CardToOrderScreen(),
      binding: CartBinding(),  // Apply the binding here
    ),
  ];
}
