import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admin/core/constants/routes.dart';
import 'package:admin/core/services/services.dart';
import 'package:admin/data/datasource/remote/auth/login_data.dart';

import '../../core/class/status_request.dart';
import '../../core/functions/handlingData.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  bool isHidePassword = true;
  LoginData loginData = LoginData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  showPassword() {
    isHidePassword = isHidePassword == true ? false : true;
    update();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoutes.signUp);
  }

  @override
  login() async {
    FormState formData = formState.currentState!;
    if (formData.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(
        email.text,
        password.text,
      );
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          if (response['data']['admin_approve'] == "1") {
            myServices.sharedPreferences
                .setString("id", response['data']['admin_id']);
            String userId = myServices.sharedPreferences.getString("id")!;
            myServices.sharedPreferences
                .setString("username", response['data']['admin_name']);
            myServices.sharedPreferences
                .setString("email", response['data']['admin_email']);
            myServices.sharedPreferences
                .setString("phone", response['data']['admin_phone']);
            myServices.sharedPreferences.setString("step", "2");
            FirebaseMessaging.instance.subscribeToTopic("admin");
            FirebaseMessaging.instance.subscribeToTopic("admin${userId}");

            Get.offNamed(AppRoutes.homepage);
          } else {
            Get.offNamed(AppRoutes.verifyCodeSignUp,
                arguments: {"email": email.text});
          }
        } else {
          Get.defaultDialog(
              title: "Warning", middleText: "Email Or Password Not Correct");
          statusRequest = StatusRequest.nodatafailure;
        }
      }
      update();
    } else {}
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
