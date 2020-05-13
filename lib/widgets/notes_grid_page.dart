import 'package:flutter/material.dart';
import '../Constants.dart';
import 'header.dart';
import 'search_bar.dart';
import 'noteGrid.dart';

class NotesGridPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Header(
              headerString: "My Notes",
            ),
          ),
          Expanded(
            flex: 2,
            child: Stack(
              overflow: Overflow.visible,
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: kappForegroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                ),
                Positioned(
                  top: -24,
                  child: SearchBar(),
                ),
                NotesGrid(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
