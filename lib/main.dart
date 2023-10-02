import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/view/Set_Alarm/SetTimerHome.dart';
import 'package:todo/view/splash/splash_screen.dart';

import 'firebase_options.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  // NotificationService notificationService = NotificationService();
  // await notificationService.init();
  // await notificationService.requestIOSPermissions();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'todo',
    options:DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        useMaterial3: true,
      ),
      home: const SplashView()
    );
  }
}

