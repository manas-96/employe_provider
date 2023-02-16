import 'package:employee_provider/helper.dart';
import 'package:employee_provider/logic/schedule_controller.dart';
import 'package:employee_provider/views/components/gradient_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'components/app_bar.dart';
import 'location_service.dart';


class Details extends StatefulWidget {
  final int index;
  const Details({Key? key, required this.index}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  ScheduleController scheduleController = Get.put(ScheduleController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Schedule",true),
      body: GradientBody(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: color3
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Shift length : ${scheduleController.scheduleList[widget.index]["shift_length"]}",style: textStyle8,),
                      const SizedBox(height: 5,),
                      Text("Total amount : ${scheduleController.scheduleList[widget.index]["total_amount"]}",style: textStyle8,),
                      const SizedBox(height: 5,),
                      Text("Start date : ${dateFormat2(scheduleController.scheduleList[widget.index]["start_date"])}",style: textStyle8,),
                      const SizedBox(height: 5,),
                      Text("End date : ${dateFormat2(scheduleController.scheduleList[widget.index]["end_date"])}",style: textStyle8,),
                      const SizedBox(height: 5,),
                      Text("Start time : ${scheduleController.scheduleList[widget.index]["start_time"]}",style: textStyle8,),
                      const SizedBox(height: 5,),
                      Text("End time : ${scheduleController.scheduleList[widget.index]["end_time"]}",style: textStyle8,),
                      const SizedBox(height: 5,),
                      Divider(color: color2,),
                      const SizedBox(height: 5,),
                      Text("Address :",style: textStyle8,),
                      ListTile(
                        title: Text(scheduleController.scheduleList[widget.index]["schedule"]["worksite"]["worksite"],style: textStyle8,),
                        subtitle: Text(scheduleController.scheduleList[widget.index]["schedule"]["worksite"]["address"]+", "+
                            scheduleController.scheduleList[widget.index]["schedule"]["worksite"]["city"],
                          style: textStyle7,
                        ),
                        trailing: IconButton(
                          onPressed: (){
                            Get.to(LocationServices());
                          },
                          icon: Icon(Icons.directions,color: color1,),
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Divider(color: color2,),
                      const SizedBox(height: 5,),
                      Text("Contact :",style: textStyle8,),
                      ListTile(
                        title: Text(scheduleController.scheduleList[widget.index]["schedule"]["contact"]["name"],style: textStyle8,),
                        subtitle: Text(scheduleController.scheduleList[widget.index]["schedule"]["contact"]["job_title"],
                          style: textStyle7,
                        ),
                        trailing: IconButton(
                          onPressed: (){
                            print(scheduleController.scheduleList[widget.index]["schedule"]["contact"]["mobile"]);
                            url_launcher.launch("tel://${scheduleController.scheduleList[widget.index]["schedule"]["contact"]["mobile"]}");
                          },
                          icon: Icon(Icons.call,color: btnColor,),
                        ),
                      )
                    ],
                  ),
                ),
              ),
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
    var dd = dateFormat(date);
    return dd+" "+formatted.toString();
  }
}
