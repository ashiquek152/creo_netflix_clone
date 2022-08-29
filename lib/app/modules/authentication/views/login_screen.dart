import 'package:creo_netflix_clone/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:creo_netflix_clone/app/modules/authentication/widgets/enter_otp.dart';
import 'package:creo_netflix_clone/app/modules/authentication/widgets/verify_otp_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SizedBox(
            width: Get.width,
            height: Get.height,
            child: Image.asset("assets/logibg.jpg", fit: BoxFit.cover),
          ),
          Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.transparent,
            body: Center(
              child: Container(
                width: Get.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.8),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(Get.height * 0.02),
                    child: GetBuilder<AuthenticationController>(
                        builder: (controller) {
                      return Column(
                        children: [
                          SizedBox(height: Get.width * 0.06),
                          Visibility(
                              visible: !controller.otpFieldVisible,
                              child: EnterOTPField()),
                          Visibility(
                              visible: controller.otpFieldVisible,
                              child: VerifyOTPField()),
                          SizedBox(height: Get.width * 0.06),
                          // SizedBox(height: Get.width * 0.06),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
