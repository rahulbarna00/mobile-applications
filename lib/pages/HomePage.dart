import 'package:flutter/material.dart';
import 'package:my_notes_app/utils/SearchBar.dart';
import '../models/note_model.dart';
import '../utils/AppBar.dart';
import '../utils/NotesView.dart';
import 'TaskScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> notes = sampleNotes; // Use the sampleNotes list

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(),
            CustomSearchBar(),
            Expanded(child: NotesView(notes: notes)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newNote = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditTaskScreen()),
          );

          if (newNote != null && newNote is Note) {
            // Update the notes list and rebuild the widget
            setState(() {
              notes.insert(0, newNote);
            });
          }
        },
        child: Icon(Icons.add),
        tooltip: 'Add Task',
      ),
    );
  }

}
