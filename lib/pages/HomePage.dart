import 'package:flutter/material.dart';
import 'package:my_notes_app/utils/SearchBar.dart';
import '../utils/AppBar.dart';
import '../utils/NotesView.dart';
import 'TaskScreen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(),
            CustomSearchBar(),
            Expanded(child: NotesView()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditTaskScreen()),
          );
        },
        child: Icon(Icons.add),
        tooltip: 'Add Task',
      ),
    );
  }
}
