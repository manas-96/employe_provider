import 'package:employee_provider/logic/profile_logic.dart';
import 'package:employee_provider/models/model_classes/user_model.dart';
import 'package:employee_provider/views/components/app_bar.dart';
import 'package:employee_provider/views/components/buttons.dart';
import 'package:employee_provider/views/components/gradient_body.dart';
import 'package:employee_provider/views/update_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper.dart';
import 'components/drawer.dart';



class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ProfileLogic profileLogic = Get.put(ProfileLogic());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Profile", true),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: color3, //This will change the drawer background to blue.
          //other styles
        ),
        child: drawer(),
      ),
      body: GradientBody(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FutureBuilder(
              future: profileLogic.getProfile(),
              builder: (context,snap){
                if(snap.connectionState==ConnectionState.done){
                  return Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: color3,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              ListTile(
                                leading: Container(
                                  height: 60,width: 60,
                                  decoration: BoxDecoration(
                                      color: color3,
                                      shape: BoxShape.circle,
                                      boxShadow:  [
                                        BoxShadow(
                                            blurRadius: 2,
                                            color: color1
                                        )
                                      ]
                                  ),
                                  child: Icon(Icons.person_outline,color: color1,),
                                ),
                                title: Text(profileLogic.displayName.value,style: TextStyle(color: color1),),
                                subtitle: Text("Provider - ${profileLogic.provider["name"]}",style: TextStyle(color: color1),),
                              ),
                              Divider(color: color4,),
                              ListTile(
                                leading: Icon(Icons.phone,color: color1,),
                                title: Text(profileLogic.displayMobile.value,style: textStyle9,),
                              ),
                              ListTile(
                                leading: Icon(Icons.email,color: color1,),
                                title: Text(profileLogic.displayEmail.value,style: textStyle9,),
                              ),
                              SizedBox(height: 10,),
                              buttons(
                                  context: context,
                                  onTap: (){
                                    Get.to(const UpdateProfile());
                                  },
                                  width: 200.0,
                                  title: "Edit profile"
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            )
          ),
        ),
      ),
    );
  }
}
