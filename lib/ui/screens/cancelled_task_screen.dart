import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_batch_nine/ui/controllers/cancelled_task_controller.dart';
import 'package:ostad_flutter_batch_nine/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:ostad_flutter_batch_nine/ui/widgets/task_card.dart';
import 'package:ostad_flutter_batch_nine/data/models/task_model.dart';

class CancelledTaskScreen extends StatelessWidget {
  CancelledTaskScreen({super.key});

  final CancelledTaskController controller = Get.put(CancelledTaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const CenteredCircularProgressIndicator();
        }

        return ListView.separated(
          itemCount: controller.cancelledTasks.length,
          itemBuilder: (context, index) {
            return TaskCard(
              taskStatus: TaskStatus.cancelled,
              taskModel: controller.cancelledTasks[index],
              refreshList: controller.getAllCancelledTasks,
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 8),
        );
      }),
    );
  }
}
