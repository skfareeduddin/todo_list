import 'package:flutter/material.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({super.key, this.context});

  final BuildContext? context;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Placeholder(),
      ),
    );
  }
}
