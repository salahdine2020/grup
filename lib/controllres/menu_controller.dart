import 'package:get/get.dart';
import '../models/menu.dart';

class MenuOrderController extends GetxController {
  var menus = <Menu>[].obs;

  @override
  void onInit() {
    fetchMenus();
    super.onInit();
  }

  void fetchMenus() {
    menus.assignAll([
      Menu(name: 'Home', link: '/home'),
      Menu(name: 'Courses', link: '/courses'),
      Menu(name: 'Account', link: '/account'),
    ]);
  }
}
