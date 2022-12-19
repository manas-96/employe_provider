import 'package:employee_provider/views/components/app_bar.dart';
import 'package:employee_provider/views/components/gradient_body.dart';
import 'package:flutter/material.dart';

import '../helper.dart';

class Gain extends StatefulWidget {
  const Gain({Key? key}) : super(key: key);

  @override
  _GainState createState() => _GainState();
}

class _GainState extends State<Gain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Gain", true),
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
                    Container(
                      width: MediaQuery.of(context).size.width/3.5,
                      height: 40,
                      decoration: BoxDecoration(
                          color: btnColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20)
                          )
                      ),
                      child: Center(
                        child: Text("Daily",style: textStyle6,),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/3.5,
                      height: 40,
                      decoration: BoxDecoration(
                        color: color3,
                      ),
                      child: Center(
                        child: Text("Weekly",style: textStyle5,),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/3.5,
                      height: 40,
                      decoration: BoxDecoration(
                          color: color3,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20)
                          )
                      ),
                      child: Center(
                        child: Text("Monthly",style: textStyle5,),
                      ),
                    ),
                  ],
                ),
              ),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Total income",style: textStyle9,),
                            SizedBox(height: 20,),
                            Row(
                              children: [
                                Text("\$",style: textStyle4,),
                                SizedBox(width: 5,),
                                Text("390.00",style: textStyle10,)
                              ],
                            )
                          ],
                        ),
                        Image.asset("images/money_bag.png",height: 50,width: 50,)
                      ],
                    )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
