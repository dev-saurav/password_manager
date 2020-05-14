import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'header.dart';

import '../Constants.dart';
import 'package:provider/provider.dart';
import '../models/data.dart';
import 'package:password_strength/password_strength.dart';
import '../generatePass.dart';

class AddNote extends StatefulWidget {
  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  var titleController = TextEditingController();
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  double passStrength;
  bool obscureText = true;
  Color passBackColor = Colors.white;

  void checkPassStrength() {
    print(passwordController.text);
    double strength = estimatePasswordStrength(passwordController.text);
    setState(() {
      if (strength < 0.3) {
        passBackColor = kErrorColor;
      } else if (strength < 0.7) {
        passBackColor = kWarningColor;
      } else {
        passBackColor = kSuccessColor;
      }
    });
  }

  void generatePass() {
    String _generatedPassword = generatePassword(true, true, true, true, 17);
    passwordController.text = _generatedPassword;
  }

  @override
  void initState() {
    super.initState();
    passwordController.addListener(checkPassStrength);
  }

  @override
  void dispose() {
    titleController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notes = Provider.of<DataModel>(context);
    final snackBarTitleError =
        SnackBar(content: Text('Please enter a proper title...'));
    final snackBarPassError =
        SnackBar(content: Text('Please enter a password...'));
    final snackBarUserNameError =
        SnackBar(content: Text('Please enter a username...'));
    final snackBarPassAdded =
        SnackBar(content: Text('Password added succesfully'));
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Header(
                  headerString: "Add Note",
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
                    Container(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  child: TextField(
                                    controller: titleController,
                                    obscureText: false,
                                    autofocus: false,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 2.0,
                                        ),
                                      ),
                                      hintText: "Enter a title",
                                      suffixIcon: IconButton(
                                        icon: Icon(Icons.cancel),
                                        onPressed: () {
                                          titleController.clear();
                                        },
                                      ),
                                    ),
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
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  child: TextField(
                                    controller: usernameController,
                                    obscureText: false,
                                    autofocus: false,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 2.0,
                                        ),
                                      ),
                                      hintText: "Enter a username",
                                      suffixIcon: IconButton(
                                        icon: Icon(Icons.cancel),
                                        onPressed: () {
                                          usernameController.clear();
                                        },
                                      ),
                                    ),
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
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                  color: passBackColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  child: TextField(
                                    controller: passwordController,
                                    obscureText: obscureText,
                                    autofocus: false,
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          borderSide: BorderSide(
                                            color: Colors.blue,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                            width: 2.0,
                                          ),
                                        ),
                                        hintText: "Enter a password",
                                        suffixIcon: Container(
                                          margin: EdgeInsets.only(right: 10),
                                          width: 80,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: <Widget>[
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    obscureText = !obscureText;
                                                  });
                                                },
                                                child: Icon(obscureText
                                                    ? Icons.visibility_off
                                                    : Icons.visibility),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  generatePass();
                                                },
                                                child: Icon(Icons.offline_bolt),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  passwordController.clear();
                                                },
                                                child: Icon(Icons.cancel),
                                              )
                                            ],
                                          ),
                                        )),
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 18),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    color: kfloatingActionButtonColor,
                                  ),
                                  child: Text("Add Password",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 15)),
                                ),
                                onPressed: () {
                                  if (titleController.text.isEmpty) {
                                    Scaffold.of(context)
                                        .showSnackBar(snackBarTitleError);
                                  } else if (usernameController.text.isEmpty) {
                                    Scaffold.of(context)
                                        .showSnackBar(snackBarUserNameError);
                                  } else if (passwordController.text.isEmpty) {
                                    Scaffold.of(context)
                                        .showSnackBar(snackBarPassError);
                                  } else {
                                    notes.addNote(
                                        titleController.text,
                                        usernameController.text,
                                        passwordController.text);
                                    Scaffold.of(context)
                                        .showSnackBar(snackBarPassAdded);
                                  }
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
