// lib/services/api_service.dart
import 'package:http/http.dart' as http;

class ApiService {
  Future<http.Response> getRequest(String url) async {
    final response = await http.get(Uri.parse(url));
    return response;
  }

  Future<http.Response> postRequest(String url, Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    return response;
  }
}
