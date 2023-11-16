//NotesView.dart
import 'package:flutter/material.dart';
import '../models/note_model.dart';

class NotesView extends StatefulWidget {
  final List<Note> notes; // Add this line to accept the notes list

  NotesView({required this.notes, Key? key}) : super(key: key);

  @override
  _NotesViewState createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.notes.length, // Update references to notes
      itemBuilder: (context, index) {
        return Card(
          elevation: 3.0,
          child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.notes[index].title), // Update references to notes
                Text(
                  '${widget.notes[index].timestamp.day}/${widget.notes[index].timestamp.month}/${widget.notes[index].timestamp.year}', // Update references to notes
                ),
              ],
            ),
            subtitle: Text(
              widget.notes[index].content, // Update references to notes
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Handle the delete task logic
                _deleteTask(index);
              },
            ),
          ),
        );
      },
    );
  }

  void _deleteTask(int index) {
    // Implement the logic to delete the task
    setState(() {
      widget.notes.removeAt(index);
    });
  }
}
