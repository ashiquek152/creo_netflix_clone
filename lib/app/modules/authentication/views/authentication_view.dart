import 'package:creo_netflix_clone/app/modules/authentication/views/login_screen.dart';
import 'package:creo_netflix_clone/app/modules/bottom_navigations/views/bottom_navigations_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/authentication_controller.dart';

class AuthenticationView extends GetView<AuthenticationController> {
   AuthenticationView({Key? key}) : super(key: key);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final authController =Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: StreamBuilder<User?>(
        stream: _firebaseAuth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Something went wrong"));
          } else if (snapshot.hasData) {
            return  BottomNavigationsView();
          } else {
            return  const LoginScreen();
          }
        },
      ),
    );
  }
}
