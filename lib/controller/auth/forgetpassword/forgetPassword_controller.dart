import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/status_request.dart';
import '../../../core/constants/routes.dart';
import '../../../core/functions/handlingData.dart';
import '../../../data/datasource/remote/auth/forgetpassword/checkemail_data.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();
  goToSignUp();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController email;
  CheckEmailData checkEmailData=CheckEmailData(Get.find());
  StatusRequest statusRequest=StatusRequest.none;

  

  @override
  checkEmail() async{
    FormState formData = formState.currentState!;
    if (formData.validate())  {
      statusRequest=StatusRequest.loading;
    update();
    var response=await checkEmailData.postData( 
      email.text,
    );
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
      Get.offNamed(AppRoutes.verifyCode,arguments: {"email":email.text} );

      }else{
        Get.defaultDialog(title: "Warning",middleText: "Email Not Correct");
        statusRequest=StatusRequest.nodatafailure;
      }
    }
    update();
    } 
  }

  @override
  goToSignUp() {
    Get.offAllNamed(AppRoutes.signUp);
  }

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }


}
