import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_batch_nine/data/service/network_client.dart';
import 'package:ostad_flutter_batch_nine/data/utils/urls.dart';
import 'package:ostad_flutter_batch_nine/ui/widgets/snack_bar_message.dart';

class RegisterController extends GetxController {
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final isLoading = false.obs;

  String? validateEmail(String? value) {
    if (!EmailValidator.validate(value?.trim() ?? '')) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? validateName(String? value, String fieldName) {
    if (value?.trim().isEmpty ?? true) {
      return 'Enter your $fieldName';
    }
    return null;
  }

  String? validateMobile(String? value) {
    String phone = value?.trim() ?? '';
    RegExp regExp = RegExp(r"^(?:\+?88|0088)?01[15-9]\d{8}$");
    if (!regExp.hasMatch(phone)) {
      return 'Enter your valid phone';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if ((value?.isEmpty ?? true) || (value!.length < 6)) {
      return 'Enter your password more than 6 letters';
    }
    return null;
  }

  Future<void> registerUser() async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;

    final requestBody = {
      "email": emailController.text.trim(),
      "firstName": firstNameController.text.trim(),
      "lastName": lastNameController.text.trim(),
      "mobile": mobileController.text.trim(),
      "password": passwordController.text
    };

    final response = await NetworkClient.postRequest(
      url: Urls.registerUrl,
      body: requestBody,
    );

    isLoading.value = false;

    if (response.isSuccess) {
      _clearFields();
      showSnackBarMessage(Get.context!, 'User registered successfully!');
    } else {
      showSnackBarMessage(Get.context!, response.errorMessage, true);
    }
  }

  void _clearFields() {
    emailController.clear();
    firstNameController.clear();
    lastNameController.clear();
    mobileController.clear();
    passwordController.clear();
  }

  @override
  void onClose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    mobileController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
