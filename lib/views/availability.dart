import 'package:employee_provider/views/components/app_bar.dart';
import 'package:employee_provider/views/components/gradient_body.dart';
import 'package:flutter/material.dart';

import '../helper.dart';


class Availability extends StatefulWidget {
  const Availability({Key? key}) : super(key: key);

  @override
  _AvailabilityState createState() => _AvailabilityState();
}

class _AvailabilityState extends State<Availability> {
  DateTime _val=DateTime.now();
  var lastdate=DateTime.now();

  DateTime _currentdate = DateTime.now();

  Future<Null> _selectdate(BuildContext context) async {
    final DateTime? _seldate= await showDatePicker(
        context: context,
        initialDate: _currentdate,
        firstDate: DateTime(_val.year, _val.month, _val.day),
        lastDate: DateTime(_val.add(Duration(days:7)).year, _val.add(Duration(days:7)).month,lastdate.add(Duration(days: 7)).day),
        builder: (context, child1) {
          return SingleChildScrollView(
            child: child1,
          );
        });
    if (_seldate!= null) {
      setState(() {

        _currentdate = _seldate;
      });
    }

  }
  String? _formattedate;
  String? day;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Availability", true),
      body: GradientBody(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: (){
                  _selectdate(context);
                },
                child: Text("press"),
                color: color3,
              )
            ],
          ),
        ),
      ),
    );
  }
}
