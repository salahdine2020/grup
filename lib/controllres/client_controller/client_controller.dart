import 'package:get/get.dart';

class ClientController extends GetxController {
  var clientName = 'John Doe'.obs;
  var clientOrders = [].obs;

  @override
  void onInit() {
    super.onInit();
    // Simulate fetching client data
    fetchClientData();
  }

  void fetchClientData() {
    // Simulating API call or data fetching for the client
    clientName.value = "Client John";
    clientOrders.value = [
      {"orderId": 1, "orderName": "Pizza"},
      {"orderId": 2, "orderName": "Burger"}
    ];
  }
}
