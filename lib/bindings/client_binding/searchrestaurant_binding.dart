import 'package:get/get.dart';

import '../../controllres/client_controller/search_restaurant_controller.dart';

class SearchRestaurantBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchRestaurantController>(() => SearchRestaurantController());
  }
}
