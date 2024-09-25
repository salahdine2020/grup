import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllres/menu_controller.dart';

class MenuView extends StatelessWidget {
  final MenuOrderController menuController = Get.find<MenuOrderController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: menuController.menus.length,
          itemBuilder: (context, index) {
            final menu = menuController.menus[index];
            return ListTile(
              title: Text(menu.name),
              onTap: () {
                Get.toNamed(menu.link);
              },
            );
          },
        );
      }),
    );
  }
}
