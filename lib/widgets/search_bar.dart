import 'package:flutter/material.dart';
import 'package:password_manager/models/data.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final searchTerm = TextEditingController();

  @override
  void dispose() {
    searchTerm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var notes = Provider.of<DataModel>(context);
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: TextField(
          controller: searchTerm,
          autofocus: false,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search for a password',
            suffixIcon: IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () {
                searchTerm.clear();
                notes.clearSearchString();
              },
            ),
          ),
          onChanged: (newString) {
            notes.setSearchString(searchTerm.text);
          },
        ),
      ),
    );
    ;
  }
}
