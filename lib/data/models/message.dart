class Message {
  final int id;
  final int? userId;
  final String content;
  final List<String>? files;
  final bool isRead;
  final DateTime created;

  Message({
    required this.id,
    this.userId,
    required this.content,
    this.files,
    required this.isRead,
    required this.created,
  });
}
