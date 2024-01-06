import 'package:flutter/material.dart';

class EditNoteScreen extends StatelessWidget {
  const EditNoteScreen({super.key, this.context, this.index});

  final BuildContext? context;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Placeholder(
            //TODO: Implement note editing functionality
            ),
      ),
    );
  }
}
