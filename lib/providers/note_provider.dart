import 'package:flutter/cupertino.dart';
import '../models/note.dart';
import '../utils/database_helper.dart';

class NoteProvider extends ChangeNotifier {
  DatabaseHelper _databaseHelper = DatabaseHelper();
  List<Note> _notes = [];

  List<Note> get notes => _notes;

  NoteProvider() {
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    final notes = await _databaseHelper.getNotes();
    _notes = _sortNotes(notes);
    notifyListeners();
  }

  Future<void> _saveNotes() async {
    await _databaseHelper.saveNotes(_notes);
  }

  List<Note> _sortNotes(List<Note> notes) {
    return notes..sort((a, b) => b.timeStamp.compareTo(a.timeStamp));
  }

  void addNote(Note note) {
    _notes.add(note);
    _notes = _sortNotes(_notes);
    _saveNotes();
    notifyListeners();
  }

  void editNote(int index, Note updatedNote) {
    _notes[index] = updatedNote;
    _notes = _sortNotes(_notes);
    _saveNotes();
    notifyListeners();
  }

  void removeNote(int index) {
    _notes.removeAt(index);
    _saveNotes();
    notifyListeners();
  }
}
