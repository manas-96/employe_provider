import 'package:employee_provider/logic/profile_logic.dart';
import 'package:employee_provider/views/components/app_bar.dart';
import 'package:employee_provider/views/components/gradient_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper.dart';
import 'components/buttons.dart';


class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  ProfileLogic profileLogic = Get.put(ProfileLogic());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: appBar("Edit profile", true),
        body: GradientBody(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  const SizedBox(height: 20,),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: color3),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: Row(
                          children: [
                            Icon(Icons.person_outline,color: color1,),
                            const SizedBox(width: 25,),
                            Expanded(
                              child: TextField(
                                controller: TextEditingController(text: profileLogic.displayName.value),
                                style: TextStyle(color: color1),
                                onChanged: (val) {
                                  profileLogic.displayName.value=val;
                                },
                                decoration: InputDecoration(
                                    hintText: "Name",
                                    hintStyle: textStyle3,
                                    border: InputBorder.none),
                              ),
                            ),
                          ],
                        )
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: color3),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: Row(
                          children: [
                            Icon(Icons.phone_android,color: color1,),
                            const SizedBox(width: 25,),
                            Expanded(
                              child: TextField(
                                controller: TextEditingController(text: profileLogic.displayMobile.value),
                                style:  TextStyle(color: color1),
                                keyboardType: TextInputType.number,
                                onChanged: (val) {
                                  profileLogic.displayMobile.value=val;
                                },
                                decoration: InputDecoration(
                                    hintText: "Mobile",
                                    hintStyle: textStyle3,
                                    border: InputBorder.none),
                              ),
                            ),
                          ],
                        )
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: color3),
                    child: ListTile(
                      leading: Icon(Icons.event_available,color: color1,),
                      title: Text("Availability",style: textStyle8,),

                      trailing: CupertinoSwitch(
                        activeColor: color1,
                        value: profileLogic.availability.value,
                        onChanged: (value) {
                          setState(() {
                            profileLogic.availability.value = value;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  InkWell(
                    onTap: (){
                      profileLogic.updateProfile();
                    },
                    child: Container(
                      height: 45,
                      width: 200.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: btnColor,

                      ),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Obx(() => profileLogic.loader.value?const CircularProgressIndicator(
                          color: Colors.white,
                        ): Text("Submit",style: titleStyle,),)
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
