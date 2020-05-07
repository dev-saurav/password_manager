import 'package:flutter/material.dart';
import 'package:password_manager/widgets/header.dart';
import 'package:password_manager/widgets/noteGrid.dart';
import 'package:password_manager/widgets/search_bar.dart';
import 'package:provider/provider.dart';
import './models/data.dart';
import './Constants.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorScreen,
      floatingActionButton: FloatingActionButton(
        backgroundColor: floatingActionButtonColor,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Header(),
            ),
            Expanded(
              flex: 2,
              child: Stack(
                overflow: Overflow.visible,
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: appForegroundColor,
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
      ),
    );
  }
}
