import 'package:employee_provider/logic/profile_logic.dart';
import 'package:employee_provider/views/availability.dart';
import 'package:employee_provider/views/change_password.dart';
import 'package:employee_provider/views/gain.dart';
import 'package:employee_provider/views/help_support.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper.dart';

class drawer extends StatefulWidget {
  const drawer({Key? key}) : super(key: key);

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  ProfileLogic profileLogic = Get.put(ProfileLogic());
  bool _switchValue = true;
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
                        color: Colors.white
                    )
                  ]
              ),
              child: Icon(Icons.person_outline,color: Colors.white,),
            ),
            title: Text(profileLogic.displayName.value,style: TextStyle(color: Colors.white),),
            subtitle: Text(profileLogic.displayEmail.value,style: TextStyle(color: color4),),
          ),),
          Divider(color: color4,),
          SizedBox(height: 20,),
          ListTile(
            leading: Icon(Icons.person_add_alt_1,color: color4,),
            title: Text("Labour provider",style: textStyle9,),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.event_available,color: color4,),
            title: Text("Availability",style: textStyle9,),

            trailing: CupertinoSwitch(
              value: _switchValue,
              onChanged: (value) {
                setState(() {
                  _switchValue = value;
                });
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.lock_outline,color: color4,),
            title: Text("Change Password",style: textStyle9,),
            onTap: (){
              Get.to(ChangePassword());
            },
          ),
          ListTile(
            leading: Icon(Icons.help,color: color4,),
            title: Text("Help & Support",style: textStyle9,),
            onTap: (){
              Get.to(HelpSupport());
            },
          ),
          ListTile(
            leading: Icon(Icons.power_settings_new_rounded,color: color4,),
            title: Text("Logout",style: textStyle9,),
            onTap: (){},
          ),
        ],
      ),
    );
  }
}

