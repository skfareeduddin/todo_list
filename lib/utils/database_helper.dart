import 'package:shared_preferences/shared_preferences.dart';
import '../models/note.dart';

class DatabaseHelper {
  static const String key = 'notes';

  Future<List<Note>> getNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final notesJson = prefs.getStringList(key);
    if (notesJson != null) {
      return notesJson.map((note) => Note.fromJson(note)).toList();
    }
    return [];
  }

  Future<void> saveNotes(List<Note> notes) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final notesJson = notes.map((note) => note.toJson()).toList();
    prefs.setStringList(key, notesJson);
  }
}
