import 'package:quiz/core/data/repositories/shared_preference_repository.dart';
import 'package:quiz/core/services/notification_service.dart';
import 'package:quiz/core/services/connectivity_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quiz/core/services/location_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quiz/app/my_app_controller.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';
import 'app/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(
    () async {
      var sharedPref = await SharedPreferences.getInstance();
      return sharedPref;
    },
  );

  Get.put(SharedPreferenceRepository());
  //Get.put(CartService());
  Get.put(LocationService());
  Get.put(ConnectivityService());
  Get.put(MyAppController());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Get.put(NotificationService());

  runApp(const MyApp());
}
