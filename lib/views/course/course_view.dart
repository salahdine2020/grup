import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllres/course_controller.dart';

class CourseView extends StatelessWidget {
  final CourseController courseController = Get.find<CourseController>();

  CourseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses'),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: courseController.courses.length,
          itemBuilder: (context, index) {
            final course = courseController.courses[index];
            return ListTile(
              title: Text(course.title),
              subtitle: Text(course.description),
            );
          },
        );
      }),
    );
  }
}
