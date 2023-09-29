import 'package:admin/linkapi.dart';
import '../../../../../core/class/crud.dart';

class VerifyCodeForgetPasswordData{
Crud crud;

VerifyCodeForgetPasswordData(this.crud);

postData(String email,String verifycode)async{
  var response=await crud.postData(AppLink.verifycodeforgetpassword, {
    "email":email ,
    "verifycode":verifycode ,

  });
 return response.fold((l) => l, (r) => r);

}


}
 