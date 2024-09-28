import 'package:get/get.dart';

import '../../controllres/client_controller/carte_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(() => CartController());
  }
}
