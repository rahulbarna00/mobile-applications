// NotesView.dart
import 'package:flutter/material.dart';
import '../models/note_model.dart';
import '../pages/TaskScreen.dart';

class NotesView extends StatefulWidget {
  final List<Note> notes;

  NotesView({required this.notes, Key? key}) : super(key: key);

  @override
  _NotesViewState createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.notes.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
          child: Card(
            elevation: 2.5,
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.notes[index].title),
                  Text(
                    '${widget.notes[index].timestamp.day}/${widget.notes[index].timestamp.month}/${widget.notes[index].timestamp.year}',
                  ),
                ],
              ),
              subtitle: Text(
                widget.notes[index].content,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      _editTask(context, widget.notes[index]);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      _deleteTask(index);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _editTask(BuildContext context, Note existingNote) async {
    // Navigate to the EditTaskScreen and pass the existing task data
    final editedNote = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditTaskScreen(note: existingNote)),
    );

    if (editedNote != null && editedNote is Note) {
      // Update the notes list and rebuild the widget
      setState(() {
        // Find the index of the existing note and replace it with the edited note
        final index = widget.notes.indexOf(existingNote);
        widget.notes[index] = editedNote;
      });
    }
  }

  void _deleteTask(int index) {
    setState(() {
      widget.notes.removeAt(index);
    });
  }
}
