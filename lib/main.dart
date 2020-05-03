import 'package:flutter/material.dart';
import './widgets/grid_item_note.dart';
import 'dummyData.dart';

void main() => runApp((MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  //var nt = Note();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2C1DA9),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFFBAB45),
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: Color(0xFF4934DD),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Notes Keep",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
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
                      color: Color(0xFF4934DD),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -20,
                    child: Container(
                      color: Colors.yellow,
                      height: 50,
                      width: 100,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: 60, left: 50, right: 50, bottom: 10),
                    child: GridView.builder(
                      itemCount: dummyNotes.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20),
                      itemBuilder: (BuildContext ctx, int i) => GridItem(
                        gridTitle: dummyNotes[i].title,
                        gridNote: dummyNotes[i].note,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
