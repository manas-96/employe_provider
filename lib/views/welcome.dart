import 'package:employee_provider/views/components/gradient_body.dart';
import 'package:employee_provider/views/splash.dart';
import 'package:employee_provider/views/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'sign_in.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  getUser()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if(preferences.getString("token")!=null){
      Get.to(const TabScreen());
    }
    else{
      Get.to(const Splash());
    }
  }
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 1),
        (){
        getUser();
        }
    );
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBody(
        child: Center(
          child: Image.asset("images/logo.png",height: 100,width: 100,),
        ),
      ),
    );
  }
}
