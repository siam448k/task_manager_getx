import 'package:get/get.dart';
import 'package:ostad_flutter_batch_nine/ui/controllers/add_new_task_controller.dart';
import 'package:ostad_flutter_batch_nine/ui/controllers/cancelled_task_controller.dart';
import 'package:ostad_flutter_batch_nine/ui/controllers/forgot_pin_controller.dart';
import 'package:ostad_flutter_batch_nine/ui/controllers/login_controller.dart';
import 'package:ostad_flutter_batch_nine/ui/controllers/new_task_controller.dart';
import 'package:ostad_flutter_batch_nine/ui/controllers/register_controller.dart';
import 'package:ostad_flutter_batch_nine/ui/controllers/reset_password_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
    Get.put(NewTaskController());
    Get.put(AddNewTaskController());
    Get.put(CancelledTaskController());
    Get.put(RegisterController());
    Get.put(ResetPasswordController());
    Get.put(ForgotPasswordPinController());
  }
}