import 'package:employee_provider/views/components/app_bar.dart';
import 'package:employee_provider/views/components/buttons.dart';
import 'package:employee_provider/views/components/gradient_body.dart';
import 'package:flutter/material.dart';

import '../helper.dart';


class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Change Password", true),
      body: GradientBody(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
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
                              obscureText: true,
                              onChanged: (val) {},
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
                SizedBox(height: 10,),
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
                              obscureText: true,
                              onChanged: (val) {},
                              decoration: InputDecoration(
                                  hintText: "New Password",
                                  hintStyle: textStyle3,
                                  border: InputBorder.none),
                            ),
                          ),
                        ],
                      )
                  ),
                ),
                SizedBox(height: 10,),
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
                              obscureText: true,
                              onChanged: (val) {},
                              decoration: InputDecoration(
                                  hintText: "Confirm Password",
                                  hintStyle: textStyle3,
                                  border: InputBorder.none),
                            ),
                          ),
                        ],
                      )
                  ),
                ),
                SizedBox(height: 20,),
                buttons(
                  context: context,
                  onTap: (){},
                  title: "Update",
                  width: MediaQuery.of(context).size.width-30
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
