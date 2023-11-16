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
          child: Dismissible(
            key: Key(widget.notes[index].toString()), // Provide a unique key
            confirmDismiss: (DismissDirection direction) async {
              return await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Confirm Delete'),
                    content: Text('Are you sure you want to delete this note?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false); // Don't dismiss
                        },
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(true); // Confirm dismiss
                        },
                        child: Text(
                          'Delete'
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            onDismissed: (direction) {
              _performDelete(index);
            },
            background: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red, // Set the background color to red
                  borderRadius: BorderRadius.circular(12.0),
                ),
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 20.0),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
            child: Card(
              elevation: 2.5,
              child: ListTile(
                onTap: () {
                  _editTask(context, widget.notes[index]);
                },
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        widget.notes[index].title,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 5.0, right: 5.0, top: 5.0),
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
                  padding: const EdgeInsets.only(
                      left: 5.0, right: 5.0, bottom: 5.0, top: 5.0),
                  child: Text(
                    'Last Edited: ${widget.notes[index].timestamp.day}/${widget.notes[index].timestamp.month}/${widget.notes[index].timestamp.year}',
                    style: TextStyle(
                      fontSize: 13.0,
                    ),
                  ),
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

  void _performDelete(int index) {
    setState(() {
      widget.notes.removeAt(index);
    });
  }
}
