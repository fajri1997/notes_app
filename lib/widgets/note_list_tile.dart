import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/pages/note_page.dart';

class NoteListTile extends StatelessWidget {
  final Note note;
  const NoteListTile({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 3,
        child: ListTile(
          leading: Icon(
            Icons.sticky_note_2_outlined,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(note.title),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return NotePage(
                    note: note,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
