import 'package:employee_provider/logic/profile_logic.dart';
import 'package:employee_provider/models/model_classes/user_model.dart';
import 'package:employee_provider/views/components/app_bar.dart';
import 'package:employee_provider/views/components/buttons.dart';
import 'package:employee_provider/views/components/gradient_body.dart';
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
                                      boxShadow: const [
                                        BoxShadow(
                                            blurRadius: 2,
                                            color: Colors.white
                                        )
                                      ]
                                  ),
                                  child:const Icon(Icons.person_outline,color: Colors.white,),
                                ),
                                title: Text("First Labor",style: TextStyle(color: Colors.white),),
                                subtitle: Text("Provider Enterprise",style: TextStyle(color: color4),),
                              ),
                              Divider(color: color4,),
                              ListTile(
                                leading: Icon(Icons.phone,color: color4,),
                                title: Text("9876543210",style: textStyle9,),
                              ),
                              ListTile(
                                leading: Icon(Icons.email,color: color4,),
                                title: Text("l@l.com.com",style: textStyle9,),
                              ),
                              SizedBox(height: 10,),
                              buttons(
                                  context: context,
                                  onTap: (){},
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
