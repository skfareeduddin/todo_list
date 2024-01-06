import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/note.dart';

import '../providers/note_provider.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key, this.context});

  final BuildContext? context;

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _contentController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    void createNote() {
      String title = _titleController.text;
      String content = _contentController.text;

      if (title.isNotEmpty && content.isNotEmpty) {
        context.read<NoteProvider>().addNote(
              Note(
                title: title,
                content: content,
                timeStamp:
                    DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.now()),
              ),
            );
        const snackBar = SnackBar(
          content: Text(
            'Note created successfully!',
            style: TextStyle(fontSize: 16.0),
          ),
          duration: Duration(seconds: 1),
        );
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
        title: const Text('Add a Note'),
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
              SizedBox(
                height: 50.0,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blueAccent),
                  ),
                  onPressed: () {
                    createNote();
                  },
                  child: const Text(
                    'Add Note',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
