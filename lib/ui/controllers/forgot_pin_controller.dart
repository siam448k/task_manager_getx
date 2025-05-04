import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_batch_nine/ui/screens/login_screen.dart';
import 'package:ostad_flutter_batch_nine/ui/screens/reset_password_screen.dart';

class ForgotPasswordPinController extends GetxController {
  final pinController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void verifyPin() {
    if (pinController.text.length != 6) {
      Get.snackbar("Invalid PIN", "Please enter a valid 6-digit PIN",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.redAccent, colorText: Colors.white);
      return;
    }

    // In a real app: verify the PIN with an API call before proceeding

    Get.to(() => ResetPasswordScreen());
  }

  void goToLogin() {
    Get.offAll(() => const LoginScreen());
  }

  @override
  void onClose() {
    pinController.dispose();
    super.onClose();
  }
}
