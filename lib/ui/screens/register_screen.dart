import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_batch_nine/ui/controllers/register_controller.dart';
import 'package:ostad_flutter_batch_nine/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:ostad_flutter_batch_nine/ui/widgets/screen_background.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: controller.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                Text('Join With Us', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 24),
                TextFormField(
                  controller: controller.emailController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(hintText: 'Email'),
                  validator: controller.validateEmail,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: controller.firstNameController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(hintText: 'First name'),
                  validator: (value) => controller.validateName(value, 'first name'),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: controller.lastNameController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(hintText: 'Last name'),
                  validator: (value) => controller.validateName(value, 'last name'),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: controller.mobileController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(hintText: 'Mobile'),
                  validator: controller.validateMobile,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: controller.passwordController,
                  decoration: const InputDecoration(hintText: 'Password'),
                  validator: controller.validatePassword,
                ),
                const SizedBox(height: 16),
                Obx(() {
                  return controller.isLoading.value
                      ? const CenteredCircularProgressIndicator()
                      : ElevatedButton(
                    onPressed: controller.registerUser,
                    child: const Icon(Icons.arrow_circle_right_outlined),
                  );
                }),
                const SizedBox(height: 32),
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                      children: [
                        const TextSpan(text: "Already have an account? "),
                        TextSpan(
                          text: 'Sign In',
                          style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.back(); // equivalent to Navigator.pop
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
