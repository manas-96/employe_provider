import 'package:flutter/material.dart';

import '../../helper.dart';


appBar(String title, bool back){
  return AppBar(
    automaticallyImplyLeading: back,
    backgroundColor: color3,
    iconTheme: const IconThemeData(
        color: Color(0xffe0ff01)
    ),
    title: Text(title,style: TextStyle(color: color1),),
    actions: [

    ],
  );
}