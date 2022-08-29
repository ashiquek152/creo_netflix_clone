import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  SettingsView({Key? key}) : super(key: key);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              try {
                // Get.offAll(const LoginScreen());
                _firebaseAuth.signOut();
              } on FirebaseAuthException catch (e) {
                log(e.message.toString());
              } catch (e) {
                log(e.toString());
              }
            },
            child: const Text("SignOut")),
      ),
    );
  }
}
