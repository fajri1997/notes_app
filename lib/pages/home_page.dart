import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/providers/note_provider.dart';
import 'package:notes_app/widgets/note_list_tile.dart';
import 'package:notes_app/providers/note_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final _titleTextEditingController = TextEditingController();

  final _bodyTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        backgroundColor: Colors.yellow.shade600,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow.shade600,
        onPressed: () {
          final notesProvider =
              Provider.of<NoteProvider>(context, listen: false);
          notesProvider.addNote(
              title: _titleTextEditingController.text,
              body: _bodyTextEditingController.text);
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Card(
                elevation: 10,
                child: ListTile(
                  title: Column(
                    children: [
                      TextField(
                        controller: _titleTextEditingController,
                        decoration: InputDecoration(
                          hintText: 'Title',
                          border: InputBorder.none,
                        ),
                      ),
                      TextField(
                        controller: _bodyTextEditingController,
                        decoration: InputDecoration(
                          hintText: 'Body',
                          border: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    iconSize: 32,
                    icon: Icon(
                      Icons.add_box,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      final notesProvider =
                          Provider.of<NoteProvider>(context, listen: false);
                      notesProvider.addNote(
                          title: _titleTextEditingController.text,
                          body: _bodyTextEditingController.text);
                    },
                  ),
                ),
              ),
            ),
            Consumer<NoteProvider>(
              builder: (context, notesProvider, child) => ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(), // <- Here
                itemCount: notesProvider.notes.length,
                itemBuilder: (BuildContext context, int index) {
                  return NoteListTile(
                    note: notesProvider.notes[index],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
