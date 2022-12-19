import 'package:flutter/material.dart';

import '../../helper.dart';


appBar(String title, bool back){
  return AppBar(
    automaticallyImplyLeading: back,
    backgroundColor: color3,
    title: Text(title),
    actions: [
      IconButton(
        icon: Icon(Icons.notifications_none,color: Colors.white,),
        onPressed: (){},
      )
    ],
  );
}