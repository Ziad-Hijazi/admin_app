import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admin/controller/auth/forgetpassword/forgetPassword_controller.dart';
import 'package:admin/core/constants/color.dart';
import 'package:admin/view/widgets/auth/custom_body_text_auth.dart';
import '../../../../core/class/handling_data_view.dart';
import '../../../../core/functions/validInput.dart';
import '../../../widgets/auth/custom_button_auth.dart';
import '../../../widgets/auth/custom_text_form_auth.dart';
import '../../../widgets/auth/custom_title_text_auth.dart';
import '../../../widgets/auth/signin_or_signup_text.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text("15".tr),
          titleTextStyle: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.grey),
          centerTitle: true,
        ),
        body: GetBuilder<ForgetPasswordControllerImp>(
            builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    color: Colors.white,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 35),
                    child: Form(
                      key: controller.formState,
                      child: ListView(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          const CustomTitleTextAuth(text: "17"),
                          const SizedBox(
                            height: 25,
                          ),
                          const CustomBodyTextAuth(text: "18"),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomTextFormAuth(
                              isNumber: false,
                              myValidator: (val) {
                                return validInput(val!, 7, 50, "email");
                              },
                              myController: controller.email,
                              label: "11".tr,
                              hint: "12".tr,
                              icon: Icons.email_outlined),
                          CustomButtonAuth(
                              text: "19".tr,
                              onPressed: () {
                                controller.checkEmail();
                              }),
                          const SizedBox(
                            height: 30,
                          ),
                          SignInOrSignUpText(
                            textOne: "42",
                            textTwo: "16",
                            onTap: () {
                              controller.goToSignUp();
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
