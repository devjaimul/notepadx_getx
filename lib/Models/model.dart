class NotesModels {
  final String title;
  final String description;
   final String createdtime;
  final String? updatedtime;

  NotesModels({
    required this.title,
    required this.description,
    required this.createdtime,
    this.updatedtime,
  });
}
