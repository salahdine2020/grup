// lib/main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'config/app_constants.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';
import 'translations/en_US.dart';
import 'translations/fr_FR.dart';
import 'bindings/home_binding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstants.appTitle,
      initialRoute: AppRoutes.login,
      getPages: AppPages.pages,
      initialBinding: HomeBinding(),  // Can initialize global services here if needed
      theme: ThemeData(
        primaryColor: AppConstants.primaryColor,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: AppConstants.primaryColor,
          elevation: 0,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: AppConstants.primaryColor,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      debugShowCheckedModeBanner: false,
      locale: Locale(AppConstants.defaultLanguage),  // Default language
      fallbackLocale: Locale('en', 'US'),  // Fallback if translation is missing
      translations: MyTranslations(),  // Load translations
      navigatorKey: Get.key,  // For GetX navigation
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
