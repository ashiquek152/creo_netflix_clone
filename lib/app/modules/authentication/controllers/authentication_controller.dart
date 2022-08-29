import 'dart:developer';

import 'package:creo_netflix_clone/app/widgets/loading.dart';
import 'package:creo_netflix_clone/app/widgets/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
  static const NETWORK_ERROR =
      "A network error (such as timeout, interrupted connection or unreachable host) has occurred.";
  static const BLOCKED_ERROR =
      "We have blocked all requests from this device due to unusual activity. Try again later.";

  String erroMessage = "";

  final mobileFieldCtrlr = TextEditingController();
  final verifyotpCtrlr = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();

  bool otpFieldVisible = false;

  final _auth = FirebaseAuth.instance;
  String verificationIDRecieved = "";

  validateMobileNumber(value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);

    if (value.isEmpty) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  getOTP() async {
    Get.dialog(const LoadingWidget(),
        barrierDismissible: false,
        transitionDuration: const Duration(seconds: 2));
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: "+91${mobileFieldCtrlr.text}",
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential).then(
            (value) {
              // Get.back();
              log("Logged in with OTP");
            },
          );
        },
        verificationFailed: (FirebaseAuthException exception) {
          log(exception.message.toString());

          switch (exception.message) {
            case NETWORK_ERROR:
              erroMessage = "Network Error";
              break;
            case BLOCKED_ERROR:
              erroMessage = BLOCKED_ERROR;
              break;
            default:
              erroMessage = "Enter a valid mobile number";
          }
          Get.back();
          snackBar(message: erroMessage, title: "Try again");
        },
        codeSent: (String verificationID, int? resendToken) {
          verificationIDRecieved = verificationID;
          otpFieldVisible = true;
          mobileFieldCtrlr.clear();
          update();
          Get.back();
        },
        codeAutoRetrievalTimeout: (String verificationID) {},
      );
    } catch (exception) {
      snackBar(message: "Something went wrong", title: "Try Again");
    }
  }

  verifyOTPandsignIn() async {
    Get.dialog(const LoadingWidget(),
        barrierDismissible: false,
        transitionDuration: const Duration(seconds: 2));
    try {
      final credential = PhoneAuthProvider.credential(
          verificationId: verificationIDRecieved,
          smsCode: verifyotpCtrlr.text.trim());
      await _auth.signInWithCredential(credential).then((value) {
        verifyotpCtrlr.clear();
        log("Signed In");
        Get.back();
        otpFieldVisible = false;
      });
    } on FirebaseAuthException catch (e) {
      snackBar(message: e.message.toString(), title: "Try Again");
    } catch (exception) {
      snackBar(message: "Something went wrong", title: "Try Again");
    }
  }
}
