class Note {
  String title;
  String content;
  DateTime timestamp;

  Note({
    required this.title,
    required this.content,
    required this.timestamp,
  });
}

List<Note> sampleNotes = [
  Note(
    title: 'Sample Note 1',
    content: 'This is content of Sample Note 1. You can create modify and delete the tasks.',
    timestamp: DateTime.now(),
  ),
];
