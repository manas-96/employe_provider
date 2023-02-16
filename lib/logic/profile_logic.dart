


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


  var availability=true.obs;
  var user = {}.obs;
  var displayName="".obs;
  var displayEmail="".obs;
  var displayMobile="".obs;

  getProfile()async{
    loader.value=true;
    getProvider();
    final result = await ApiResponse().getFunctionWithAuth("profile");
    if(result["availability"]==1){
      availability.value=true;
    }
    else{
      availability.value=false;
    }
    displayEmail.value = result["email"];
    displayName.value= result["name"];
    displayMobile.value= result["mobile"];
    loader.value=false;
    return result;
  }
  var provider = {}.obs;
  getProvider()async{
    final result = await ApiResponse().getFunctionWithAuth("get-provider");
    provider.value=result;
  }
  updateProfile()async{
    loader.value=true;
    final body = {
      "name": displayName.value,
      "mobile": displayMobile.value,
      "availability": availability.value?"1":"0",
      "email": displayEmail.value
    };
    final result = await ApiResponse().postFunctionWithAuth(body, "profile");
    loader.value=false;
    if(result!="failed"){
      Get.snackbar("Success", "Profile updated successfully",colorText: Colors.green);
    }
    else {
      Get.snackbar("Failed", "Try after sometime",colorText: Colors.red);
    }
  }
}