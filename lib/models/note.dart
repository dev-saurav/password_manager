import 'package:flutter/material.dart';

enum Category { category1, category2 }

class Note {
  final String id;
  final String title;
  final String note;
  final Category category;
  final DateTime dateTime;

  Note({
    @required this.id,
    @required this.title,
    @required this.note,
    @required this.category,
    @required this.dateTime,
  });
}
