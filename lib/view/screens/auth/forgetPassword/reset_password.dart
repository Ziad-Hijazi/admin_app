import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admin/controller/auth/forgetpassword/resetPassword_controller.dart';
import 'package:admin/core/constants/color.dart';
import 'package:admin/view/widgets/auth/custom_body_text_auth.dart';
import '../../../../core/class/handling_data_view.dart';
import '../../../../core/functions/validInput.dart';
import '../../../widgets/auth/custom_button_auth.dart';
import '../../../widgets/auth/custom_text_form_auth.dart';
import '../../../widgets/auth/custom_title_text_auth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text("33".tr),
        titleTextStyle: Theme.of(context)
            .textTheme
            .displayLarge!
            .copyWith(color: AppColor.grey),
        centerTitle: true,
      ),
      body: GetBuilder<ResetPasswordControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            color: Colors.white,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 35),
            child: Form(
              key: controller.formState,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTitleTextAuth(text: "34".tr),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomBodyTextAuth(text: "38".tr),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextFormAuth(
                      hideText: true,
                      isNumber: false,
                      myValidator: (val) {
                        return validInput(val!, 10, 30, "password");
                      },
                      myController: controller.password,
                      label: "13".tr,
                      hint: "14".tr,
                      icon: Icons.lock_outline),
                  CustomTextFormAuth(
                      hideText: true,
                      isNumber: false,
                      myValidator: (val) {
                        return validInput(val!, 10, 30, "password");
                      },
                      myController: controller.repassword,
                      label: "35".tr,
                      hint: "36".tr,
                      icon: Icons.lock_outline),
                  CustomButtonAuth(
                      text: "37".tr,
                      onPressed: () {
                        controller.goToSuccessResetPassword();
                      }),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
