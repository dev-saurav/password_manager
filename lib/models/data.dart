import 'package:flutter/material.dart';
import 'note.dart';
import 'package:provider/provider.dart';

class DataModel extends ChangeNotifier {
  String _searchString;
  List<Note> _notes = [
    Note(
      id: '1',
      title: 'note 1',
      note: 'this is the note',
      category: Category.category1,
      dateTime: DateTime.now(),
    ),
    Note(
      id: '2',
      title: 'note 2',
      note: 'this is the note',
      category: Category.category1,
      dateTime: DateTime.now(),
    ),
    Note(
      id: '3',
      title: 'note 3',
      note: 'this is the note',
      category: Category.category1,
      dateTime: DateTime.now(),
    ),
    Note(
      id: '4',
      title: 'note 4',
      note: 'this is the note',
      category: Category.category1,
      dateTime: DateTime.now(),
    ),
    Note(
      id: '5',
      title: 'note 5',
      note: 'this is the note',
      category: Category.category1,
      dateTime: DateTime.now(),
    ),
    Note(
      id: '6',
      title: 'note 6',
      note: 'this is the note',
      category: Category.category1,
      dateTime: DateTime.now(),
    ),
    Note(
      id: '7',
      title: 'note 7',
      note: 'this is the note',
      category: Category.category1,
      dateTime: DateTime.now(),
    ),
    Note(
      id: '8',
      title: 'note 8',
      note: 'this is the note',
      category: Category.category1,
      dateTime: DateTime.now(),
    ),
    Note(
      id: '9',
      title: 'note 9',
      note: 'this is the note',
      category: Category.category1,
      dateTime: DateTime.now(),
    )
  ];

  void setSearchString(String toBeSearched) {
    _searchString = toBeSearched;
    notifyListeners();
  }

  void clearSearchString() {
    _searchString = "";
    notifyListeners();
  }

  void addNote(String noteText, String userText, String passText) {
    _notes.insert(
        0,
        Note(
          id: DateTime.now().toString(),
          title: noteText,
          note: passText,
          category: Category.category1,
          dateTime: DateTime.now(),
        ));
    notifyListeners();
  }

  List<Note> get getNotes {
    if (_searchString == null) {
      return _notes;
    } else {
      return _notes.where((item) {
        return item.title.contains(_searchString);
      }).toList();
    }
  }
}
