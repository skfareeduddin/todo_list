import 'package:flutter/material.dart';
import 'package:todo_list/screens/home_screen.dart';

void main() => runApp(const TODOList());

class TODOList extends StatelessWidget {
  const TODOList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO List App',
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
