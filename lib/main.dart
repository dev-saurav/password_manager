import 'package:flutter/material.dart';
import 'package:password_manager/widgets/addNote.dart';
import 'package:password_manager/widgets/add_credit_card_page.dart';
import 'package:password_manager/widgets/notes_grid_page.dart';
import 'package:provider/provider.dart';
import './models/data.dart';
import './Constants.dart';
import './widgets/check_pass_page.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';

void main() => runApp((MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: ChangeNotifierProvider(
        create: (context) => DataModel(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var pages = {
    kPages.AddNotePage: AddNote(),
    kPages.CheckPassPage: CheckPass(),
    kPages.NoteGridPage: NotesGridPage(),
    kPages.AddCreditCardPage: AddCreditCardPage(),
  };
  Widget currPage = null;
  void changePage(Widget choosenPage) {
    setState(() {
      currPage = choosenPage;
    });
  }

  @override
  void initState() {
    currPage = pages[kPages.NoteGridPage];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: kbackgroundColorScreen,
      body: currPage,
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: currPage == pages[kPages.AddNotePage] ||
              currPage == pages[kPages.AddCreditCardPage]
          ? null
          : FabCircularMenu(
              alignment: Alignment.bottomCenter,
              fabOpenIcon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              fabCloseIcon: Icon(
                Icons.close,
                color: Colors.white,
              ),
              ringColor: kfloatingActionButtonColor,
              fabColor: kfloatingActionButtonColor,
              children: <Widget>[
                  FlatButton.icon(
                      onPressed: () {
                        changePage(pages[kPages.AddCreditCardPage]);
                      },
                      textColor: Colors.white,
                      icon: Icon(Icons.credit_card),
                      label: Text("Add Card")),
                  FlatButton.icon(
                      onPressed: () {},
                      textColor: Colors.white,
                      icon: Icon(Icons.note_add),
                      label: Text("Add Note")),
                  FlatButton.icon(
                      onPressed: () {
                        changePage(pages[kPages.AddNotePage]);
                      },
                      textColor: Colors.white,
                      icon: Icon(
                        Icons.verified_user,
                        color: Colors.white,
                      ),
                      label: Text("Add Password")),
                ]),

      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  changePage(pages[kPages.NoteGridPage]);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.dashboard,
                        color: currPage == pages[kPages.NoteGridPage]
                            ? kfloatingActionButtonColor
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  changePage(pages[kPages.CheckPassPage]);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.check,
                        color: currPage == pages[kPages.CheckPassPage]
                            ? kfloatingActionButtonColor
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  changePage(pages[kPages.CheckPassPage]);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.people,
                        color: currPage == pages[kPages.CheckPassPage]
                            ? kfloatingActionButtonColor
                            : Colors.grey,
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
