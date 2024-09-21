// lib/utils/helpers.dart
class Helpers {
  static String formatCurrency(double amount) {
    return '\$${amount.toStringAsFixed(2)}';
  }

  static DateTime parseDate(String dateStr) {
    return DateTime.parse(dateStr);
  }
}
