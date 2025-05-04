import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_batch_nine/data/service/network_client.dart';
import 'package:ostad_flutter_batch_nine/data/utils/urls.dart';
import 'package:ostad_flutter_batch_nine/ui/widgets/snack_bar_message.dart';

class AddNewTaskController extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final isSubmitting = false.obs;

  void onSubmit() {
    if (formKey.currentState!.validate()) {
      _addNewTask();
    }
  }

  Future<void> _addNewTask() async {
    isSubmitting.value = true;

    final body = {
      "title": titleController.text.trim(),
      "description": descriptionController.text.trim(),
      "status": "New"
    };

    final response = await NetworkClient.postRequest(
      url: Urls.createTaskUrl,
      body: body,
    );

    isSubmitting.value = false;

    if (response.isSuccess) {
      titleController.clear();
      descriptionController.clear();
      showSnackBarMessage(Get.context!, 'New task added!');
    } else {
      showSnackBarMessage(Get.context!, response.errorMessage);
    }
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}
