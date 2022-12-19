import 'package:employee_provider/models/api_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ScheduleController extends GetxController{
  var scheduleList = [].obs;
  var loading = false.obs;
  getScheduling()async{
    loading.value=true;
    final result = await ApiResponse().getFunctionWithAuth("shifts");
    scheduleList.clear();
    for(int i=0; i<result.length; i++){
      scheduleList.add(result[i]);
    }
    loading.value=false;
  }
  var worksiteList = [].obs;
  getWorksite()async{
    loading.value=true;
    final result = await ApiResponse().getFunctionWithAuth("worksites");
    worksiteList.clear();
    for(int i=0; i<result["data"].length; i++){
      worksiteList.add(result["data"][i]);
    }
    loading.value=false;
  }
}
