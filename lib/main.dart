import 'package:barokah_cars_project/app/modules/onboarding_screen/views/onboarding_screen_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await GetStorage.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Barocars Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      home: const OnboardingScreenView(),
    ),
  );
}
