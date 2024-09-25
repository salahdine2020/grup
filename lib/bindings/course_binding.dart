import 'package:get/get.dart';
import 'package:grup/controllres/course_controller.dart';


class CourseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CourseController());
  }
}
