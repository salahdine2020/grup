import 'package:get/get.dart';
import 'package:grup/controllres/resturant_controller/course_controller.dart';


class CourseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CourseController());
  }
}
