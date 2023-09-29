import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admin/core/class/handling_data_view.dart';
import 'package:admin/core/constants/color.dart';
import 'package:admin/core/functions/alert_exit_app.dart';
import 'package:admin/core/functions/validInput.dart';
import 'package:admin/view/widgets/auth/custom_body_text_auth.dart';
import '../../../controller/auth/login_controller.dart';
import '../../widgets/auth/custom_button_auth.dart';
import '../../widgets/auth/custom_text_form_auth.dart';
import '../../widgets/auth/custom_title_text_auth.dart';
import '../../widgets/auth/logo.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text("4".tr),
          titleTextStyle: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.grey),
          centerTitle: true,
        ),
        body: WillPopScope(
            onWillPop: alertExitApp,
            child: GetBuilder<LoginControllerImp>(
              builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  color: Colors.white,
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 35),
                  child: Form(
                    key: controller.formState,
                    child: ListView(
                      children: [
                        const Logo(),
                        const SizedBox(
                          height: 30,
                        ),
                        const CustomTitleTextAuth(text: "2"),
                        const SizedBox(
                          height: 25,
                        ),
                        const CustomBodyTextAuth(text: "3"),
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
                        GetBuilder<LoginControllerImp>(
                          builder: (controller) => CustomTextFormAuth(
                              onTapIcon: () {
                                controller.showPassword();
                              },
                              hideText: controller.isHidePassword,
                              isNumber: false,
                              myValidator: (val) {
                                return validInput(val!, 10, 30, "password");
                              },
                              myController: controller.password,
                              label: "13".tr,
                              hint: "14".tr,
                              icon: Icons.lock_outline),
                        ),
                        InkWell(
                          onTap: () {
                            controller.goToForgetPassword();
                          },
                          child: Text(
                            "15".tr,
                            style: const TextStyle(color: AppColor.grey),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        CustomButtonAuth(
                          text: "4".tr,
                          onPressed: () {
                            controller.login();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }
}
