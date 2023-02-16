import 'package:employee_provider/helper.dart';
import 'package:employee_provider/logic/schedule_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;


class Worksite extends StatefulWidget {
  const Worksite({Key? key}) : super(key: key);

  @override
  State<Worksite> createState() => _WorksiteState();
}

class _WorksiteState extends State<Worksite> {
  ScheduleController scheduleController = Get.put(ScheduleController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scheduleController.getWorksite();
  }
  @override
  Widget build(BuildContext context) {
    return Obx(() => workSite());
  }
  workSite(){
    if(scheduleController.loading.value){
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if(scheduleController.worksiteList.isEmpty){
      return  Center(
        child: Text("Empty list",style: TextStyle(color: color1,fontWeight: FontWeight.bold),),
      );
    }
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: scheduleController.worksiteList.length,
      itemBuilder: (context,index){
        if(scheduleController.loading.value){
          return CircularProgressIndicator(
            color: color1,
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          child: Container(
            decoration: BoxDecoration(
              color: color3,
              borderRadius: BorderRadius.circular(10)
            ),
            child: ListTile(
              title: Text(scheduleController.worksiteList[index]["worksite"],
                style: textStyle8,
              ),
              subtitle: Text(scheduleController.worksiteList[index]["address"]+", "+scheduleController.worksiteList[index]["city"],
              style: textStyle7,),
              trailing: IconButton(
                icon: Icon(Icons.phone,color: btnColor,),
                onPressed: (){
                  url_launcher.launch("tel://${scheduleController.worksiteList[index]["contact_no"]}");
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
