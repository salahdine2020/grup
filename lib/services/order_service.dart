// lib/services/order_service.dart
import 'package:get/get.dart';

import 'api_service.dart';
import '../config/app_constants.dart';
import 'package:http/http.dart' as http;

class OrderService {
  final ApiService _apiService = Get.find<ApiService>();

  Future<http.Response> fetchOrders(String userId) async {
    final url = "${AppConstants.orderEndpoint}/$userId";
    return _apiService.getRequest(url);
  }
}
