import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllres/compte_controller.dart';

class CompteView extends StatelessWidget {
  final CompteController compteController = Get.find<CompteController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compte'),
      ),
      body: Obx(() {
        final compte = compteController.compte.value;
        return Column(
          children: [
            Text('Username: ${compte.username}'),
            Text('Email: ${compte.email}'),
            ElevatedButton(
              onPressed: () {
                compteController.updateUsername('NewUsername');
              },
              child: Text('Change Username'),
            ),
          ],
        );
      }),
    );
  }
}
