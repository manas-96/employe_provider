import 'package:employee_provider/helper.dart';
import 'package:flutter/material.dart';


class GradientBody extends StatelessWidget {
  final child;
  const GradientBody({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/background.png"),
          fit: BoxFit.cover
        )
      ),
      child: child,
    );
  }
}
