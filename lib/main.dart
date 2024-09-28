// lib/main.dart
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grup/bindings/client_binding/searchrestaurant_binding.dart';
import 'package:grup/bindings/resturant_bindings/auth_binding.dart';
import 'package:grup/bindings/client_binding/client_binding.dart';
import 'package:grup/views/main_screen.dart';
import 'config/app_constants.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';
import 'translations/en_US.dart';
import 'translations/fr_FR.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    // Log the error to the console
    FlutterError.dumpErrorToConsole(details);

    // Optionally, log the error to an external service (e.g., Firebase Crashlytics, Sentry)
    if (kDebugMode) {
      print('------------------- ERRORS ----------------');
      print(details);
      print('------------------- ERRORS ----------------');
    }
  };
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstants.appTitle,
      initialRoute: AppRoutes.login,//AppRoutes.login, // AppRoutes.client
      getPages: AppPages.pages,//AppPages.pages,
      initialBinding: AuthBinding(),//AuthBinding(), // SearchRestaurantBinding()  // Can initialize global services here if needed
      theme: ThemeData(
        primaryColor: AppConstants.primaryColor,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: AppConstants.primaryColor,
          elevation: 0,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: AppConstants.primaryColor,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      debugShowCheckedModeBanner: false,
      locale: const Locale(AppConstants.defaultLanguage),  // Default language
      fallbackLocale: const Locale('en', 'US'),  // Fallback if translation is missing
      translations: MyTranslations(),  // Load translations
      navigatorKey: Get.key,
    );
  }
}

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': enUS,
    'fr_FR': frFR,
  };
}
