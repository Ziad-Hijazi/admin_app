import 'package:get/get.dart';
import 'package:admin/core/constants/routes.dart';
import '../../../core/class/status_request.dart';
import '../../../core/functions/handlingData.dart';
import '../../../data/datasource/remote/auth/forgetpassword/verifycodeforgetpassword_data.dart';

abstract class VerifyCodeController extends GetxController {
  goToResetPassword(String verifycode);
  checkCode();
}

class VerifyCodeControllerImp extends VerifyCodeController {
    VerifyCodeForgetPasswordData verifyCodeForgetPasswordData=VerifyCodeForgetPasswordData(Get.find());
  StatusRequest statusRequest=StatusRequest.none;
  String? email;
  @override
  goToResetPassword(verifycode) async {
   statusRequest=StatusRequest.loading;
    update();
    var response=await verifyCodeForgetPasswordData.postData( 
      email!,verifycode
    );
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
    Get.offNamed(AppRoutes.resetPassword,arguments: {"email":email});
      }else{
        Get.defaultDialog(title: "Warning",middleText: "Verify Code is Not Correct");
        statusRequest=StatusRequest.nodatafailure;
      }
    }
    update();
    } 
    
  @override
  checkCode() {}

  @override
  void onInit() {
    email=Get.arguments['email'];
    super.onInit();
  }

}