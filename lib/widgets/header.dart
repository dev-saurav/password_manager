import 'package:flutter/material.dart';
import '../Constants.dart';

class Header extends StatelessWidget {
  final String headerString;
  Header({this.headerString});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: kappForegroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Center(
        child: Text(
          headerString,
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
