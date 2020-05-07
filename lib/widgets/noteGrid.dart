import 'package:flutter/material.dart';
import 'grid_item_note.dart';
import 'package:provider/provider.dart';
import '../models/data.dart';

class NotesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notes = Provider.of<DataModel>(context);
    return Container(
      margin: EdgeInsets.only(top: 60, left: 50, right: 50, bottom: 10),
      child: GridView.builder(
        itemCount: notes.getNotes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
        itemBuilder: (BuildContext ctx, int i) => GridItem(
          gridTitle: notes.getNotes[i].title,
          gridNote: notes.getNotes[i].note,
        ),
      ),
    );
  }
}
