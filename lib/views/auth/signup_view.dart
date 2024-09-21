// lib/views/auth/signup_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grup/controllres/auth_controller.dart';
import '../../utils/validators.dart';

class SignupView extends StatelessWidget {
  final AuthController _authController = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('signup'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _authController.emailController,
                validator: Validators.validateEmail,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                controller: _authController.passwordController,
                validator: Validators.validatePassword,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 20),
              Obx(() {
                return _authController.isLoading.value
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _authController.signup();
                    }
                  },
                  child: Text('signup'.tr),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
