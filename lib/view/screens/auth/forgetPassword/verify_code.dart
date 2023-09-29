import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:admin/controller/auth/forgetpassword/verifyCode_controller.dart';
import 'package:admin/core/constants/color.dart';
import 'package:admin/view/widgets/auth/custom_body_text_auth.dart';
import '../../../widgets/auth/custom_title_text_auth.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
  VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title:  Text("30".tr),
        titleTextStyle: Theme.of(context)
            .textTheme
            .displayLarge!
            .copyWith(color: AppColor.grey),
        centerTitle: true,
      ),
      body:Container(
        color: Colors.white,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 35),
        child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
             CustomTitleTextAuth(text: "31".tr),
            const SizedBox(
              height: 25,
            ),
             CustomBodyTextAuth(
                text: "32".tr),
            const SizedBox(
              height: 30,
            ),
            OtpTextField(
              fieldWidth: 60,
              borderRadius: BorderRadius.circular(20),
              numberOfFields: 5,
              borderColor:const Color(0xFF512DA8),
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {
                controller.goToResetPassword(verificationCode);
              },
            ),
          ],
        ),
      ),
    );
  }
}
