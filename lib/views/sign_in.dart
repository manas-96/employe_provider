import 'package:employee_provider/logic/auth_logic.dart';
import 'package:employee_provider/views/components/gradient_body.dart';
import 'package:employee_provider/views/home_page.dart';
import 'package:employee_provider/views/sign_up.dart';
import 'package:employee_provider/views/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper.dart';
import 'components/buttons.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthLogic authLogic = Get.put(AuthLogic());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: GradientBody(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.18,
                ),
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    color: color3,
                    shape: BoxShape.circle
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      "images/Vector.png",
                       height: 60,
                       width: 60,
                       fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Welcome back",
                  style: textStyle1,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Enter your credential to sign in",
                  style: textStyle3,
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: color3),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: Row(
                      children: [
                        Icon(Icons.person_outline,color: color4,),
                        const SizedBox(width: 5,),
                        Expanded(
                          child: TextField(
                            style: const TextStyle(color: Colors.white),
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (val) {
                              authLogic.email.value=val;
                            },
                            decoration: InputDecoration(
                                hintText: "Email/Username",
                                hintStyle: textStyle3,
                                border: InputBorder.none),
                          ),
                        ),
                      ],
                    )
                  ),
                ),
                SizedBox(height: 20,),

                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: color3),
                  child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Row(
                        children: [
                          Icon(Icons.lock_outline,color: color4,),
                          const SizedBox(width: 5,),
                          Expanded(
                            child: TextField(
                              style: const TextStyle(color: Colors.white),
                              obscureText: true,
                              onChanged: (val) {
                                authLogic.password.value=val;
                              },
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle: textStyle3,
                                  border: InputBorder.none),
                            ),
                          ),
                        ],
                      )
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

                Obx(() => InkWell(
                  onTap: () {authLogic.logIn();},
                  child: Container(
                    height: 45,
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: btnColor,

                    ),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: authLogic.loader.value?const CircularProgressIndicator(backgroundColor: Colors.white,):
                      Text("LOGIN",style: titleStyle,),
                    ),
                  ),
                )),
                const SizedBox(
                  height: 20,
                ),
                Text("Forgot password?",style: textStyle4,),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?   ",style: textStyle5,),
                    InkWell(
                      onTap: (){
                        Get.to(SignUp());
                      },
                      child: Text("Sign up",style: textStyle4,),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
