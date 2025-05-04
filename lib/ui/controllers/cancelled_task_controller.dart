import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_batch_nine/data/models/task_list_model.dart';
import 'package:ostad_flutter_batch_nine/data/models/task_model.dart';
import 'package:ostad_flutter_batch_nine/data/service/network_client.dart';
import 'package:ostad_flutter_batch_nine/data/utils/urls.dart';
import 'package:ostad_flutter_batch_nine/ui/widgets/snack_bar_message.dart';

class CancelledTaskController extends GetxController {
  final isLoading = false.obs;
  final cancelledTasks = <TaskModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllCancelledTasks();
  }

  Future<void> getAllCancelledTasks() async {
    isLoading.value = true;

    final response = await NetworkClient.getRequest(url: Urls.cancelledTaskListUrl);

    if (response.isSuccess) {
      final taskListModel = TaskListModel.fromJson(response.data ?? {});
      cancelledTasks.assignAll(taskListModel.taskList);
    } else {
      showSnackBarMessage(Get.context!, response.errorMessage, true);
    }

    isLoading.value = false;
  }
}
