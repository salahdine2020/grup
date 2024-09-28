import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../config/app_constants.dart';
import '../../../controllres/auth_controller.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/validators.dart'; // Import AppConstants

class LoginView extends StatelessWidget {
  final AuthController _authController = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();
  final appbarTitle = "Hot";
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.primaryColor,  // Use primary color from AppConstants
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo at the top (PNG instead of SVG)
              Image.asset(
                'assets/images/logo.png',  // Path to the PNG logo
                height: 150,
              ),
              const SizedBox(height: 40),
        
              // Phone number input field
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    SvgPicture.string(
                      AppConstants.phoneSvg,  // Reference the phone SVG from AppConstants
                      height: 24,
                      width: 24,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: _authController.emailController,
                        validator: Validators.validateEmail,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Votre numéro de téléphone',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
        
              // Password input field
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    SvgPicture.string(
                      AppConstants.lockSvg,  // Reference the lock SVG from AppConstants
                      height: 24,
                      width: 24,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: _authController.passwordController,
                        validator: Validators.validatePassword,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Votre mot de passe',
                        ),
                        obscureText: true,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
        
              // "Allons-y" button
              Obx(() {
                return _authController.isLoading.value
                    ? const CircularProgressIndicator()
                    : SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,  // Black button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _authController.login();
                      }
                      //Get.toNamed(AppRoutes.order);
                    },
                    child: const Text(
                      'ALLONS - Y !',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              }),
              const SizedBox(height: 20),
        
              // Forgot password link (without underline)
              GestureDetector(
                onTap: () {
                  // Handle password reset action
                },
                child: const Text(
                  'Mot de passe oublié',
                  style: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.none,  // Remove underline
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
