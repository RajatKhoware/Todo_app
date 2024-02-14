class Todo {
  int id;
  String title;
  bool isCompleted;

  Todo({
    required this.id,
    required this.title,
    required this.isCompleted,
  });

  @override
  toString() {
    return 'id: $id, title: $title, isCompleted: $isCompleted';
  }
}
