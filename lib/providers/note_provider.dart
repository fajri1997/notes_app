import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';

class NoteProvider extends ChangeNotifier {
  var notes = [];
  void addNote({required String title, required String body}) {
    var note = Note(
      id: notes.isNotEmpty ? notes[notes.length - 1].id + 1 : 1,
      title: title,
      body: body,
    );

    notes.insert(0, note);

    notifyListeners();
  }

  Note getNote({required int id}) {
    return notes.firstWhere((note) => note.id == id);
  }
}
