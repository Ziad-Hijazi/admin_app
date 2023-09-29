import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admin/core/constants/routes.dart';

import '../../../core/class/status_request.dart';
import '../../../core/functions/handlingData.dart';
import '../../../data/datasource/remote/auth/forgetpassword/resetpassword_data.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController password;
  late TextEditingController repassword;

  ResetPasswordData resetPasswordData=ResetPasswordData(Get.find());
  StatusRequest statusRequest=StatusRequest.none;
  String? email;

  @override
  goToSuccessResetPassword()async {
    if(password.text!=repassword.text){
      return Get.defaultDialog(title: "Warning",middleText: "Password Not Match");
    }
    FormState formData = formState.currentState!;
    if (formData.validate()) {
         statusRequest=StatusRequest.loading;
    update();
    var response=await resetPasswordData.postData( 
      email!,password.text
    );
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
      Get.offNamed(AppRoutes.successResetPassword);

      }else{
        Get.defaultDialog(title: "Warning",middleText: "Try Again");
        statusRequest=StatusRequest.nodatafailure;
      }
    }
    update();
    } 
  }

  @override
  resetPassword() {}

  @override
  void onInit() {
    email=Get.arguments['email'];
    password = TextEditingController();
    repassword = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}
