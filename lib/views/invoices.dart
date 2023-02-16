import 'package:employee_provider/logic/invoice_logic.dart';
import 'package:employee_provider/logic/schedule_controller.dart';
import 'package:employee_provider/views/components/app_bar.dart';
import 'package:employee_provider/views/components/gradient_body.dart';
import 'package:employee_provider/views/components/loader_widget.dart';
import 'package:employee_provider/views/components/not_found_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper.dart';
import 'components/drawer.dart';


class Invoices extends StatefulWidget {
  const Invoices({Key? key}) : super(key: key);

  @override
  _InvoicesState createState() => _InvoicesState();
}

class _InvoicesState extends State<Invoices> {
  InvoiceLogic invoiceLogic = Get.put(InvoiceLogic());

  @override
  void initState() {
    invoiceLogic.getInvoices(0);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Invoices", true),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: color3, //This will change the drawer background to blue.
          //other styles
        ),
        child: const drawer(),
      ),
      body: GradientBody(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 15,),
              Obx(() => Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        if(!invoiceLogic.btnValue[0]){
                          invoiceLogic.btnValue[0]=true;
                          invoiceLogic.btnValue[2]=false;
                          invoiceLogic.btnValue[1]=false;
                          invoiceLogic.getInvoices(0);
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width/3.5,
                        height: 40,
                        decoration: BoxDecoration(
                            color: invoiceLogic.btnValue[0]? btnColor:color3,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20)
                            )
                        ),
                        child: Center(
                          child: Text("All",style: invoiceLogic.btnValue[0]? textStyle6:textStyle5,),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        if(!invoiceLogic.btnValue[1]){
                          invoiceLogic.btnValue[1]=true;
                          invoiceLogic.btnValue[0]=false;
                          invoiceLogic.btnValue[2]=false;
                          invoiceLogic.getInvoices(1);
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width/3.5,
                        height: 40,
                        decoration: BoxDecoration(
                          color: invoiceLogic.btnValue[1]? btnColor: color3,
                        ),
                        child: Center(
                          child: Text("Paid",style: invoiceLogic.btnValue[1]? textStyle6:textStyle5,),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        if(!invoiceLogic.btnValue[2]){
                          invoiceLogic.btnValue[2]=true;
                          invoiceLogic.btnValue[0]=false;
                          invoiceLogic.btnValue[1]=false;
                          invoiceLogic.getInvoices(2);
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width/3.5,
                        height: 40,
                        decoration: BoxDecoration(
                            color: invoiceLogic.btnValue[2]? btnColor: color3,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20)
                            )
                        ),
                        child: Center(
                          child: Text("Unpaid",style: invoiceLogic.btnValue[2]? textStyle6:textStyle5,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),),
              SizedBox(height: 15,),
              Padding(
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
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Text("\$",style: textStyle4,),
                            SizedBox(width: 5,),
                            Obx(() => Text(invoiceLogic.totalAmount.toString(),style: textStyle10,))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Obx(() => listing())
            ],
          ),
        ),
      ),
    );
  }
  listing(){
    if(invoiceLogic.loading.value){
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if(invoiceLogic.invoices.isEmpty){
      return const Text(" ");
    }
    return ListView.builder(
      itemCount: invoiceLogic.invoices.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
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
                  Text(invoiceLogic.invoices[index]["is_paid"]==0?"Paid":"Unpaid",style: textStyle9,),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      Text("\$",style: textStyle4,),
                      SizedBox(width: 5,),
                      Text(invoiceLogic.invoices[index]["total_amount"]!,style: textStyle10,)
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
