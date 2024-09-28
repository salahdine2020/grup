import 'package:get/get.dart';

import '../../controllres/resturant_controller/menu_controller.dart';

class MenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MenuOrderController());
  }
}
