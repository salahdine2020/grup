import 'package:get/get.dart';
import '../../models/compte.dart';

class CompteController extends GetxController {
  var compte = Compte(username: 'JohnDoe', email: 'john@example.com').obs;

  void updateUsername(String newUsername) {
    compte.update((val) {
      val?.username = newUsername;
    });
  }
}
