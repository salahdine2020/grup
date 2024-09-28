import 'package:get/get.dart';

import '../../controllres/client_controller/client_controller.dart';
import '../../controllres/client_controller/search_restaurant_controller.dart';

class ClientBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClientController>(() => ClientController(), fenix: true);
  }
}
