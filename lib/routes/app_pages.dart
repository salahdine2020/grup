// lib/routes/app_pages.dart
import 'package:get/get.dart';
import '../views/home/home_view.dart';
import '../views/auth/login_view.dart';
import '../views/auth/signup_view.dart';
import '../views/cart/cart_view.dart';
import '../views/cart/checkout_view.dart';
import '../views/order/order_view.dart';
import '../bindings/home_binding.dart';
import '../bindings/auth_binding.dart';
import '../bindings/cart_binding.dart';
import '../bindings/order_binding.dart';
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
      page: () => OrderScreen(),
      binding: OrderBinding(),
    ),
  ];
}
