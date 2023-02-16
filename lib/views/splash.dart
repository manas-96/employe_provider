import 'package:employee_provider/views/components/buttons.dart';
import 'package:employee_provider/views/sign_in.dart';
import 'package:employee_provider/views/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  getUser()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if(preferences.getString("token")!=null){
      Get.to(const TabScreen());
    }
    else{
      Get.to(const SignIn());
    }
  }
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        color: bgColor,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Image.asset(
                "images/background.png",
                height: MediaQuery.of(context).size.height*0.6,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: -10,
              left: 0,
              right: 0,
              child: Image.asset(
                "images/bg.png",
                height: MediaQuery.of(context).size.height*0.6,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height*0.1,
              left: 0,
              right: 0,
              bottom: MediaQuery.of(context).size.height*0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("WELCOME",style: textStyle1,),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.1,
                  ),
                  Image.asset(
                    "images/group.png",
                    height: MediaQuery.of(context).size.height*0.24,
                    width: MediaQuery.of(context).size.width*0.6,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
            Positioned(
                top: MediaQuery.of(context).size.height*0.7,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Usa Ready To Go",style: textStyle2,),
                      SizedBox(height: 10,),
                      Text("There are two primary ways to tackle frontend development when "
                          "building an application with Laravel, and which it is ",
                        style: textStyle3,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20,),
                      splashButton(
                          title: "CONTINUE",
                          onTap: (){
                            getUser();
                          },
                          width: MediaQuery.of(context).size.width*0.6
                      )
                    ],
                  ),
                )
            ),

          ],
        ),
      ),
    );
  }
}
