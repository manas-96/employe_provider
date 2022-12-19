import 'package:flutter/material.dart';

import '../../helper.dart';


buttons({context, title, onTap, width}){
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 45,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: btnColor,

      ),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(title,style: titleStyle,),
      ),
    ),
  );
}
splashButton({title, onTap, width}){
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 45,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.transparent,
          border: Border.all(color: Colors.white)
      ),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(title,style: titleStyle2,),
      ),
    ),
  );
}
