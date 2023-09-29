import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admin/controller/auth/successResetPassword_controller.dart';
import '../../../../core/constants/color.dart';
import '../../../widgets/auth/custom_button_auth.dart';
import '../../../widgets/auth/custom_title_text_auth.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller =
        Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      appBar: AppBar(
        backgroundColor: const Color(0xffFAFAFA),
        elevation: 0.0,
        title: Text("27".tr),
        titleTextStyle: Theme.of(context)
            .textTheme
            .displayLarge!
            .copyWith(color: AppColor.grey),
        centerTitle: true,
      ),
      body: Column(children: [
        const SizedBox(
          height: 30,
        ),
        const Center(
          child: Icon(
            Icons.check_circle_outline,
            size: 250,
            color: AppColor.primaryColor,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        const CustomTitleTextAuth(
          text: "39",
        ),
        const SizedBox(
          height: 80,
        ),
        const Spacer(),
        SizedBox(
          width: 400,
          child: CustomButtonAuth(
            onPressed: () {
              controller.goToLoginPade();
            },
            text: "40".tr,
          ),
        ),
        const SizedBox(
          height: 70,
        ),
      ]),
    );
  }
}
