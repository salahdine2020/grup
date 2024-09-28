import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllres/delivery_controller/delivery_controller.dart';  // Adjust the path accordingly

class DeliveryView extends StatelessWidget {
  const DeliveryView({super.key});

  @override
  Widget build(BuildContext context) {
    final DeliveryController controller = Get.find<DeliveryController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery Dashboard'),
      ),
      body: Obx(() {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, ${controller.deliveryName.value}!'),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: controller.deliveryTasks.length,
                itemBuilder: (context, index) {
                  final task = controller.deliveryTasks[index];
                  return ListTile(
                    title: Text('Task ${task['taskName']}'),
                    subtitle: Text('Task ID: ${task['taskId']}'),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
