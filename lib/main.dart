import 'package:flutter/material.dart';
import 'package:password_manager/widgets/addNote.dart';
import 'package:password_manager/widgets/notes_grid_page.dart';
import 'package:provider/provider.dart';
import './models/data.dart';
import './Constants.dart';
import './widgets/check_pass_page.dart';

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
    bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom != 0.0;
    return Scaffold(
      backgroundColor: kbackgroundColorScreen,
      body: currPage,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: keyboardIsOpened
          ? null
          : FloatingActionButton(
              backgroundColor: kfloatingActionButtonColor,
              onPressed: () {
                changePage(pages[kPages.AddNotePage]);
              },
              child: Icon(Icons.add),
            ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  changePage(pages[kPages.NoteGridPage]);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Icon(
                          Icons.dashboard,
                          color: currPage == pages[kPages.NoteGridPage]
                              ? kdarkbackgroundColor
                              : Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Notes',
                        style: TextStyle(
                          color: currPage == pages[kPages.NoteGridPage]
                              ? kdarkbackgroundColor
                              : Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  changePage(pages[kPages.CheckPassPage]);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Icon(
                          Icons.check,
                          color: currPage == pages[kPages.CheckPassPage]
                              ? kdarkbackgroundColor
                              : Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Check Password',
                        style: TextStyle(
                          color: currPage == pages[kPages.CheckPassPage]
                              ? kdarkbackgroundColor
                              : Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
