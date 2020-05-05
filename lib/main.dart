import 'package:flutter/material.dart';
import 'package:password_manager/widgets/search_bar.dart';
import 'package:provider/provider.dart';
import './widgets/grid_item_note.dart';
import './models/data.dart';

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
    final notes = Provider.of<DataModel>(context);
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
                    top: -24,
                    child: Container(
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      child: SearchBar(),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: 60, left: 50, right: 50, bottom: 10),
                    child: GridView.builder(
                      itemCount: notes.getNotes.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20),
                      itemBuilder: (BuildContext ctx, int i) => GridItem(
                        gridTitle: notes.getNotes[i].title,
                        gridNote: notes.getNotes[i].note,
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
