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
    title: 'Meeting Notes',
    content: 'Discuss project timelines and goals.',
    timestamp: DateTime.now(),
  ),
  Note(
    title: 'Ideas for App',
    content: 'Brainstorm new features and improvements.',
    timestamp: DateTime.now(),
  ),
];
