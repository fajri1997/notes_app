import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/models/note.dart';

class NoteListTile extends StatelessWidget {
  final Note note;
  const NoteListTile({Key? key, required Note this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => GoRouter.of(context).push('/note/${note.id}'),
        child: ListTile(
          title: Text(note.title),
          leading: Icon(
            Icons.sticky_note_2_outlined,
            color: Colors.yellow.shade600,
          ),
        ),
      ),
    );
  }
}
