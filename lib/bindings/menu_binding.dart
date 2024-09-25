import 'package:get/get.dart';
import '../controllres/menu_controller.dart';

class MenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MenuOrderController());
  }
}
