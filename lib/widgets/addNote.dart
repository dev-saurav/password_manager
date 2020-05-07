import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:password_manager/widgets/input_text_field.dart';
import '../Constants.dart';

class AddNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60),
          topRight: Radius.circular(60),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: kfloatingActionButtonColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: Radius.circular(60),
              ),
            ),
            child: Text(
              "Add New Password",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InputTextField(
                widthOfBar: MediaQuery.of(context).size.width * 0.9,
                hintText: "Enter suitable title",
                fillColor: Colors.white,
                focusBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                enableBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InputTextField(
                widthOfBar: MediaQuery.of(context).size.width * 0.9,
                hintText: "Enter a password",
                fillColor: Colors.white,
                focusBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                enableBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: kfloatingActionButtonColor,
                  ),
                  child: Text(
                    "Generate Password",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                onPressed: () {},
              ),
              FlatButton(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: kfloatingActionButtonColor,
                  ),
                  child: Text(
                    "Check Password",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                onPressed: () {},
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: kfloatingActionButtonColor,
                  ),
                  child: Text("Add Password",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15)),
                ),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
