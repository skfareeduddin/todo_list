import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/providers/note_provider.dart';
import 'package:todo_list/screens/add_note.dart';
import 'package:todo_list/screens/edit_note.dart';
import 'package:todo_list/screens/home_screen.dart';

void main() => runApp(const TODOList());

class TODOList extends StatelessWidget {
  const TODOList({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => NoteProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TODO List App',
        initialRoute: '/home',
        routes: {
          '/home': (context) => const HomeScreen(),
          '/add': (context) => const AddNoteScreen(),
          '/edit': (context) => const EditNoteScreen(),
        },
      ),
    );
  }
}
