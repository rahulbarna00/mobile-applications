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
          child: GestureDetector(
            onTap: (){
              _editTask(context, widget.notes[index]);
            },
            child: Card(
              elevation: 2.5,
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        widget.notes[index].title,
                        style: TextStyle(
                          fontWeight: FontWeight.w400
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                      child: Text(
                        widget.notes[index].content,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ],
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0, top: 5.0),
                  child: Text(
                    'Last Edited: ${widget.notes[index].timestamp.day}/${widget.notes[index].timestamp.month}/${widget.notes[index].timestamp.year}',
                    style: TextStyle(
                        fontSize: 13.0,
                    ),
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                    children: [
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
