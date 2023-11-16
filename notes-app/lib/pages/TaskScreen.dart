import 'package:flutter/material.dart';
import '../models/note_model.dart';

class EditTaskScreen extends StatelessWidget {
  final Note? note; // Accept an optional existing note
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  // Update the constructor to accept an optional existing note
  EditTaskScreen({Key? key, this.note}) : super(key: key) {
    // If an existing note is provided, populate the text controllers with its data
    if (note != null) {
      titleController.text = note!.title;
      contentController.text = note!.content;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Task Title',
              ),
            ),
            Divider(
              thickness: 1.0,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: TextField(
                  maxLines: null,
                  controller: contentController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Task Content',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                String taskTitle = titleController.text;
                String taskContent = contentController.text;

                Note editedNote = Note(
                  title: taskTitle,
                  content: taskContent,
                  timestamp: DateTime.now(),
                );

                Navigator.pop(context, editedNote);
              },
              child: const Text('Save Task'),
            ),
          ],
        ),
      ),
    );
  }
}
