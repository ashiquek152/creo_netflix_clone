import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // ignore: deprecated_member_use
  FlutterNativeSplash.removeAfter(initialization);
  
  runApp(
    GetMaterialApp(
      title: "Netflix Clone",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      unknownRoute:AppPages.routes[0]
    ),
  );
}
Future initialization(BuildContext context) async {
  await Future.delayed(const Duration(seconds: 3));
  
}
