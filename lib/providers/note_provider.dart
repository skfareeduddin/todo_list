import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/note.dart';

class NoteProvider extends ChangeNotifier {
  final List<Note> _notes = [];

  List<Note> get notes => _notes;

  void addNote(Note note) {
    _notes.add(note);
    notifyListeners();
  }

  void editNote(int index, Note updatedNote) {
    _notes[index] = updatedNote;
    notifyListeners();
  }

  void removeNote(int index) {
    _notes.removeAt(index);
    notifyListeners();
  }
}
