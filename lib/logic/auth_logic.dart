



import 'package:employee_provider/models/api_response.dart';
import 'package:employee_provider/views/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../views/sign_in.dart';

class AuthLogic extends GetxController{

  RxBool loader = false.obs;
  RxString email="".obs, password = "".obs;
  logIn()async{
    if(email.value=="") {
      Get.snackbar("Validation error", "Please enter your email",colorText: Colors.red);
      return;
    }
    if(password.value==""){
      Get.snackbar("Validation error", "Please enter your password",colorText: Colors.red);
      return;
    }
    final body={
      "email": email.value,
      "password": password.value,
      "device_name": "platformVersion",
    };
    print(body);
    loader.value=true;
    final result = await ApiResponse().postFunction(body,"login");
    print(result);
    loader.value=false;
    if(result!="failed"){
      _storeAuth(result["access_token"]);
      Get.to(()=>const TabScreen());
    }
    else{
      Get.snackbar("Failed to sign in", "Please enter a valid credential",colorText: Colors.red);
    }
  }
  _storeAuth(token)async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("token", token);
  }
  forgotPassword(String email)async{
    if(email=="") {
      Get.snackbar("Validation error", "Please enter your email",colorText: Colors.red);
      return;
    }
    final body={
      "email": email,
    };
    loader.value=true;
    final result = await ApiResponse().postFunction(body,"forgot_password");
    loader.value=false;
    if(result=="success"){
      
    }
    else{
      Get.snackbar("Validation error", "Please enter a valid email",colorText: Colors.red);
    }
  }

}