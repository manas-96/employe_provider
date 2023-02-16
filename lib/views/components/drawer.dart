import 'package:employee_provider/logic/profile_logic.dart';
import 'package:employee_provider/views/availability.dart';
import 'package:employee_provider/views/change_password.dart';
import 'package:employee_provider/views/gain.dart';
import 'package:employee_provider/views/help_support.dart';
import 'package:employee_provider/views/sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helper.dart';

class drawer extends StatefulWidget {
  const drawer({Key? key}) : super(key: key);

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  ProfileLogic profileLogic = Get.put(ProfileLogic());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileLogic.getProfile();
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(height: 20,),
          Obx(() => ListTile(
            leading: Container(
              height: 60,width: 60,
              decoration: BoxDecoration(
                  color: color3,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2,
                        color: color1
                    )
                  ]
              ),
              child: Icon(Icons.person_outline,color: color1,),
            ),
            title: Text(profileLogic.displayName.value,style: TextStyle(color: color1),),
            subtitle: Text(profileLogic.displayEmail.value,style: TextStyle(color: color1),),
          ),),
          SizedBox(height: 10,),
          Divider(color: color2,),
          SizedBox(height: 20,),
          ListTile(
            leading: Icon(Icons.person_add_alt_1,color: color1,),
            title: Text("Labour provider",style: textStyle9,),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.event_available,color: color1,),
            title: Text("Availability",style: textStyle9,),

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
          ListTile(
            leading: Icon(Icons.lock_outline,color: color1,),
            title: Text("Change Password",style: textStyle9,),
            onTap: (){
              Get.to(ChangePassword());
            },
          ),
          ListTile(
            leading: Icon(Icons.help,color: color1,),
            title: Text("Help & Support",style: textStyle9,),
            onTap: (){
              Get.to(const HelpSupport());
            },
          ),
          ListTile(
            leading: Icon(Icons.power_settings_new_rounded,color: color1,),
            title: Text("Logout",style: textStyle9,),
            onTap: (){
              logout();
            },
          ),
        ],
      ),
    );
  }
  logout()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
    Get.to(const SignIn());
  }
}

