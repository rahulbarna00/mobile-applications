import 'package:flutter/material.dart';
import '../models/note_model.dart';

class NotesView extends StatelessWidget {
  final List<Note> notes = sampleNotes; // Use the sampleNotes list

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3.0,
          child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(notes[index].title),
                Text(
                  '${notes[index].timestamp.day}/${notes[index].timestamp.month}/${notes[index].timestamp.year}',
                ),
              ],
            ),
            subtitle: Text(
              notes[index].content,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      },
    );
  }
}
