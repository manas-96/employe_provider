import 'package:employee_provider/views/components/gradient_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper.dart';
import 'components/buttons.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBody(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
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
                      "images/Vector2.png",
                      height: 60,
                      width: 60,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Hi!",
                  style: textStyle1,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Input the form to crate an account",
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
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (val) {},
                              decoration: InputDecoration(
                                  hintText: "  Username",
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
                          Icon(Icons.email_outlined,color: color4,),
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (val) {},
                              decoration: InputDecoration(
                                  hintText: "  Email",
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
                          Icon(Icons.phone_android,color: color4,),
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (val) {},
                              decoration: InputDecoration(
                                  hintText: "  Mobile",
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
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (val) {},
                              decoration: InputDecoration(
                                  hintText: "  Password",
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
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (val) {},
                              decoration: InputDecoration(
                                  hintText: "  Confirm password",
                                  hintStyle: textStyle3,
                                  border: InputBorder.none),
                            ),
                          ),
                        ],
                      )
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                buttons(
                    context: context,
                    title: "CREATE ACCOUNT",
                    onTap: () {},
                    width: MediaQuery.of(context).size.width)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
