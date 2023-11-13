import 'package:flutter/material.dart';

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
          // Add any other widgets or buttons you need for creating a new task
          ElevatedButton(
            onPressed: () {
              // Handle the logic for saving the new task
              String taskTitle = titleController.text;
              String taskContent = contentController.text;

              // Print or use taskTitle and taskContent as needed
              print('Task Title: $taskTitle');
              print('Task Content: $taskContent');

              Navigator.pop(context);


            },
            child: Text('Save Task'),
          ),
        ],
      ),
    );
  }
}