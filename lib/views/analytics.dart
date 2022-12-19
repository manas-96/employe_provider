import 'package:employee_provider/logic/invoice_logic.dart';
import 'package:employee_provider/views/components/app_bar.dart';
import 'package:employee_provider/views/components/drawer.dart';
import 'package:employee_provider/views/components/gradient_body.dart';
import 'package:employee_provider/views/worksite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper.dart';


class Analytics extends StatefulWidget {
  const Analytics({Key? key}) : super(key: key);

  @override
  _AnalyticsState createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {
  InvoiceLogic invoiceLogic = Get.put(InvoiceLogic());
  List btnValue=[
    true,
    false
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    invoiceLogic.getInvoices(0);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Analytics", true),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: color3, //This will change the drawer background to blue.
          //other styles
        ),
        child: drawer(),
      ),
      body: GradientBody(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          if(!btnValue[0]){
                            btnValue[0]=true;
                            btnValue[1]=false;
                          }
                        });
                      },
                      child: Container(
                        width: (MediaQuery.of(context).size.width-40)/2,
                        height: 40,
                        decoration: BoxDecoration(
                            color: btnValue[0]?btnColor: color3,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20)
                            )
                        ),
                        child: Center(
                          child: Text("Skill",style: btnValue[0]? textStyle6 : textStyle7,),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          if(!btnValue[1]){
                            btnValue[1]=true;
                            btnValue[0]=false;
                          }
                        });
                      },
                      child: Container(
                        width: (MediaQuery.of(context).size.width-40)/2,
                        height: 40,
                        decoration: BoxDecoration(
                            color: btnValue[1]?btnColor: color3,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20)
                            )
                        ),
                        child: Center(
                          child: Text("WorkSite",style: btnValue[1]? textStyle6 : textStyle7),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              btnValue[0]?skill():const Worksite(),

            ],
          ),
        ),
      ),
    );
  }
  skill(){
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
            color: color3,
            borderRadius: BorderRadius.circular(15)
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Total income",style: textStyle9,),
              SizedBox(height: 8,),
              Row(
                children: [
                  Text("\$",style: textStyle4,),
                  SizedBox(width: 5,),
                  Obx(() => Text(invoiceLogic.totalAmount.string,style: textStyle10,))
                ],
              ),
              SizedBox(height: 15,),
              Text("Total hours",style: textStyle9,),
              SizedBox(height: 8,),
              Row(
                children: [
                  Icon(Icons.hourglass_bottom,color: btnColor,),
                  SizedBox(width: 5,),
                  Obx(() => Text(invoiceLogic.totalHours.string,style: textStyle10,))
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
