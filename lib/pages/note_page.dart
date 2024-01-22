import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';

class NotePage extends StatefulWidget {
  final Note note;
  const NotePage({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.note.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Card(
        elevation: 4,
        child: Center(
          child: Text(
            widget.note.body,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
