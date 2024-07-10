class Message {
  final int id;
  final int userId;
  final String content;
  final String? file;
  final bool isRead;
  final String created;

  Message({
    required this.id,
    required this.userId,
    required this.content,
    this.file,
    required this.isRead,
    required this.created,
  });
}
