import 'package:get/get.dart';
import '../models/course.dart';

class CourseController extends GetxController {
  var courses = <Course>[].obs;

  @override
  void onInit() {
    fetchCourses();
    super.onInit();
  }

  void fetchCourses() {
    // Simulating fetching data from API or database
    courses.assignAll([
      Course(id: '1', title: 'Flutter Basics', description: 'Learn the basics of Flutter'),
      Course(id: '2', title: 'Advanced Flutter', description: 'Dive deep into Flutter development'),
    ]);
  }

  void addCourse(Course course) {
    courses.add(course);
  }
}
