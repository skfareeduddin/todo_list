import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/providers/note_provider.dart';
import 'package:todo_list/screens/add_note.dart';
import 'package:todo_list/screens/edit_note.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void goToAddNote(BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddNoteScreen(
            context: context,
          ),
        ),
      );
    }

    void goToEditNote(BuildContext context, int index) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditNoteScreen(
            context: context,
            index: index,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO List App'),
        titleTextStyle: const TextStyle(fontSize: 20.0),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 5.0,
        shadowColor: Colors.grey,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          goToAddNote(context);
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Consumer<NoteProvider>(
          builder: (context, noteProvider, child) {
            return ListView.builder(
              itemCount: noteProvider.notes.length,
              itemBuilder: (context, index) {
                final notes = noteProvider.notes[index];
                return ListTile(
                  title: Text(notes.title.length > 15
                      ? '${notes.title.substring(0, 15)}...'
                      : notes.title),
                  subtitle: Text(notes.content.length > 32
                      ? '${notes.content.substring(0, 32)}...'
                      : notes.content),
                  trailing: Text(
                    'Last updated at:\n${notes.timeStamp}',
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {
                    goToEditNote(context, index);
                  },
                  onLongPress: () {
                    noteProvider.removeNote(index);
                    const snackBar = SnackBar(
                      content: Text(
                        'Note deleted successfully!',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      duration: Duration(seconds: 1),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
