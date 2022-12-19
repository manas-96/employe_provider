import 'package:get/get.dart';

import '../models/api_response.dart';

class InvoiceLogic extends GetxController{
  var btnValue=[
    true,
    false,
    false
  ].obs;
  var invoices = [].obs;
  var loading = false.obs;
  var totalAmount = 0.obs;
  var totalHours=0.obs;
  getInvoices(btnValue)async
  {
    loading.value=true;
    invoices.clear();
    final result = await ApiResponse().getFunctionWithAuth("shifts");
    totalAmount.value=0;
    totalHours.value=0;
    for(int i=0; i<result.length; i++){
      totalAmount.value = totalAmount.value+ int.parse(result[i]["total_amount"]);
      var hours =int.parse(result[i]["normal_hours"])+int.parse(result[i]["ot_hours"])+int.parse(result[i]["dt_hours"]);
      totalHours.value= totalHours.value+hours;
      print(totalHours.value);
      if(btnValue==0){
        invoices.add(result[i]);
      }
      else if(btnValue==1){
        if(result[i]["is_paid"]==0) {
          invoices.add(result[i]);
        }
      }
      else{
        if(result[i]["is_paid"]!=0) {
          invoices.add(result[i]);
        }
      }

    }
    loading.value=false;
  }

  var worksiteList = [].obs;
  getWorksite()async{
    loading.value=true;
    final result = await ApiResponse().getFunctionWithAuth("worksites");
    worksiteList.clear();
    for(int i=0; i<result.length; i++){
      worksiteList.add(result[i]);
    }
    loading.value=false;
  }
}