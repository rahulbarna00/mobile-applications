import 'package:flutter/material.dart';
import '../models/note_model.dart';

class EditTaskScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Title Text Box
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              hintText: 'Task Title',
            ),
          ),
          SizedBox(height: 16.0), // Add some space between text boxes
          // Content Text Box
          Expanded(
            child: SingleChildScrollView(
              child: TextField(
                maxLines: null,
                controller: contentController,
                decoration: InputDecoration(
                  hintText: 'Task Content',
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0), // Add some space between text boxes
          ElevatedButton(
            onPressed: () async {
              // Handle the logic for saving the new task
              String taskTitle = titleController.text;
              String taskContent = contentController.text;

              // Create a new Note instance
              Note newNote = Note(
                title: taskTitle,
                content: taskContent,
                timestamp: DateTime.now(),
              );

              // Navigate back to the previous screen and pass the newNote as the result
              Navigator.pop(context, newNote);
            },
            child: Text('Save Task'),
          ),
        ],
      ),
    );
  }
}