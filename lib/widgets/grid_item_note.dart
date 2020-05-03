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
        boxShadow: [
          BoxShadow(
              color: Colors.black54,
              blurRadius: 2.0, // has the effect of softening the shadow
              spreadRadius: 2.0,
              offset: Offset(
                5.0,
                5.0,
              ) // has the effect of extending the shadow
              )
        ],
      ),
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
