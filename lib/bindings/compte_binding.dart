import 'package:get/get.dart';

import '../controllres/compte_controller.dart';

class CompteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CompteController());
  }
}
