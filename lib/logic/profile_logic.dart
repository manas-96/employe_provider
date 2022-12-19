


import 'package:employee_provider/models/api_response.dart';
import 'package:employee_provider/models/model_classes/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileLogic extends GetxController{
  RxBool loader = false.obs;
  RxString oldPass="".obs, newPass="".obs, confirmPass="".obs;
  changePassword()async{
    if(oldPass.value=="") {
      Get.snackbar("Validation error", "Please enter your Older password",colorText: Colors.red);
      return;
    }
    if(newPass.value!=confirmPass.value){
      Get.snackbar("Validation error", "Password & confirm password should be same",colorText: Colors.red);
      return;
    }
    final body={
      "old_password": oldPass.value,
      "password": newPass.value,
      "confirm_password": confirmPass.value,
    };
    loader.value=true;
    final result = await ApiResponse().postFunction(body,"change-password");
    loader.value=false;
    if(result=="success"){
      Get.snackbar("", "Password changed successfully",colorText: Colors.green);
    }
    else{
      Get.snackbar("Failed", "Current password doesn't match",colorText: Colors.red);
    }
  }

  RxString name="".obs, email="".obs, mobile = "".obs;
  RxInt availability=1.obs;
  var user = {}.obs;
  var displayName="".obs;
  var displayEmail="".obs;
  getProfile()async{
    loader.value=true;
    final result = await ApiResponse().getFunctionWithAuth("profile");
    displayEmail.value = result["email"];
    displayName.value= result["name"];
    loader.value=false;
    return result;
  }
}