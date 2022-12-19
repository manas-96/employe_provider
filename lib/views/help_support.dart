import 'package:employee_provider/views/components/app_bar.dart';
import 'package:employee_provider/views/components/gradient_body.dart';
import 'package:flutter/material.dart';

import '../helper.dart';
import 'components/buttons.dart';


class HelpSupport extends StatefulWidget {
  const HelpSupport({Key? key}) : super(key: key);

  @override
  _HelpSupportState createState() => _HelpSupportState();
}

class _HelpSupportState extends State<HelpSupport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Help&Support", true),
      body: GradientBody(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: color3),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (val) {},
                        decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: textStyle3,
                            border: InputBorder.none),
                      )
                  ),
                ),
                SizedBox(height: 12,),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: color3),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 15),
                      child: TextField(
                        maxLines: 10,
                        keyboardType: TextInputType.multiline,
                        onChanged: (val) {},
                        decoration: InputDecoration(
                            hintText: "Message...",
                            hintStyle: textStyle3,
                            border: InputBorder.none),
                      )
                  ),
                ),
                SizedBox(height: 20,),
                buttons(
                    context: context,
                    onTap: (){},
                    title: "Submit",
                    width: MediaQuery.of(context).size.width-30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
