import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final String gridTitle;
  final String gridNote;
  GridItem({this.gridTitle, this.gridNote});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: <Widget>[
          Text(
            gridTitle,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text(gridNote),
        ],
      ),
    );
  }
}
