import 'package:employee_provider/views/components/app_bar.dart';
import 'package:employee_provider/views/components/drawer.dart';
import 'package:employee_provider/views/components/gradient_body.dart';
import 'package:flutter/material.dart';

import '../helper.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Home", true),
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ListTile(
              //   leading: IconButton(
              //     icon: Icon(Icons.menu_outlined,color: Colors.white,),
              //     onPressed: (){},
              //   ),
              //   title: Text("Hi! Krish",style: textStyle1,),
              //   trailing: IconButton(
              //     icon: Icon(Icons.notifications_none,color: Colors.white,),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: color3,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5,),
                    child: ListTile(
                      leading: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white
                        ),
                        child: Center(
                          child: Text("LOGO"),
                        ),
                      ),
                      title: Text("Labour Provider",style: textStyle1,),
                      subtitle: Text("ABC Enterprise",style: textStyle4,),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Container(
                  height: MediaQuery.of(context).size.height*0.6,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage("https://serpmedia.org/scigen/images/googlemaps-nyc-standard.png?crc=3787557525"),
                      fit: BoxFit.cover
                    )
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
