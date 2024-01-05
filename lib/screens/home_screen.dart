import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/providers/note_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO List'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Consumer<NoteProvider>(
          builder: (context, noteProvider, child) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final notes = noteProvider.notes[index];
                return ListTile(
                  title: Text(notes.title),
                  subtitle: Text(notes.content),
                  trailing: Text('Last updated at: ${notes.timeStamp}'),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
