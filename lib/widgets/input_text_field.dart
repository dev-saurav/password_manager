import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final Color fillColor;
  final String hintText;
  final focusBorder;
  final enableBorder;
  final widthOfBar;
  InputTextField(
      {this.fillColor,
      this.hintText,
      this.focusBorder,
      this.enableBorder,
      this.widthOfBar});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthOfBar,
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: TextField(
          autofocus: false,
          decoration: InputDecoration(
            focusedBorder: focusBorder,
            enabledBorder: enableBorder,
            hintText: hintText,
            suffixIcon: IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () {},
            ),
          ),
          onChanged: (newString) {},
        ),
      ),
    );
  }
}
