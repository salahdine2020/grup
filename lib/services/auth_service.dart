// lib/services/auth_service.dart
import '../translations/fr_FR.dart';
import 'api_service.dart';
import 'package:get/get.dart';
import '../config/app_constants.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final ApiService _apiService = Get.find<ApiService>();

  Future<http.Response> login(String email, String password) async {
    return _apiService.postRequest(AppConstants.loginEndpoint, {
      "email": email,
      "password": password,
    });
  }

  Future<http.Response> signup(String email, String password) async {
    return _apiService.postRequest(AppConstants.signupEndpoint, {
      "email": email,
      "password": password,
    });
  }
}
