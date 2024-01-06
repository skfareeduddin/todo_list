import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/providers/note_provider.dart';

import '../models/note.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({super.key, this.context, this.index});

  final BuildContext? context;
  final int? index;

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    final Note existingNote = context.read<NoteProvider>().notes[widget.index!];
    _titleController = TextEditingController(text: existingNote.title);
    _contentController = TextEditingController(text: existingNote.content);
  }

  @override
  Widget build(BuildContext context) {
    void saveNote() {
      final String newTitle = _titleController.text;
      final String newContent = _contentController.text;

      if (newTitle.isNotEmpty && newContent.isNotEmpty) {
        context.read<NoteProvider>().editNote(
              widget.index!,
              Note(
                title: newTitle,
                content: newContent,
                timeStamp: DateFormat('dd-MM-yyyy HH:mm:ss').format(
                  DateTime.now(),
                ),
              ),
            );

        const snackBar = SnackBar(
          content: Text(
            'Note edited successfully!',
            style: TextStyle(fontSize: 16.0),
          ),
          duration: Duration(seconds: 2),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.pop(context);
      } else {
        const snackBar = SnackBar(
          content: Text(
            'Title/content cannot be empty!',
            style: TextStyle(fontSize: 16.0),
          ),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
        titleTextStyle: const TextStyle(fontSize: 20.0),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: 20.0,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 5.0,
        shadowColor: Colors.grey,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Enter Title'),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _contentController,
                decoration: const InputDecoration(labelText: 'Enter Content'),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                ),
                onPressed: () {
                  saveNote();
                },
                child: const Text(
                  'Edit Note',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
