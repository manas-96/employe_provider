import 'package:employee_provider/logic/schedule_controller.dart';
import 'package:employee_provider/views/components/app_bar.dart';
import 'package:employee_provider/views/components/gradient_body.dart';
import 'package:employee_provider/views/details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../helper.dart';
import 'components/drawer.dart';


class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  ScheduleController scheduleController = Get.put(ScheduleController());

  var date = DateTime.now();

  List btnValue=[
    true,
    false
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scheduleController.getScheduling();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Schedule",true),
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
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [

                const SizedBox(height: 15,),
                Obx(() => scheduleController.loading.value?const CircularProgressIndicator():
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: scheduleController.scheduleList.length,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: color3
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(dateFormat(scheduleController.scheduleList[index]["start_date"]),
                                  style: TextStyle(fontSize: 16,color: color4,fontWeight: FontWeight.w400 ),
                                ),
                                Text(dateFormat2(scheduleController.scheduleList[index]["start_date"]),
                                  style: TextStyle(fontSize: 13,color: color4,fontWeight: FontWeight.w400 ),
                                )
                              ],
                            ),
                            title: Text(scheduleController.scheduleList[index]["schedule"]["worksite"]["worksite"]??"No Shift",style: textStyle8,),
                            subtitle: Text("${scheduleController.scheduleList[index]["start_time"].toString().substring(0,5)} -- "
                                "${scheduleController.scheduleList[index]["end_time"].toString().substring(0,5)}",style: textStyle7,),
                            onTap: (){
                              Get.to(Details(index: index));
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
  dateFormat(date){
    final DateFormat formatter = DateFormat('dd');
    final String formatted = formatter.format(DateTime.parse(date));
    return formatted.toString();
  }
  dateFormat2(date){
    final DateFormat formatter = DateFormat('MMMM');
    final String formatted = formatter.format(DateTime.parse(date));
    return formatted.toString().substring(0,3);
  }
}
