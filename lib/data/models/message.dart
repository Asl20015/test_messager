class Message {
  final int id;
  final int companionId;
  final bool isMy;
  final String content;
  final List<String>? files;
  final bool isRead;
  final DateTime created;

  Message({
    required this.id,
    required this.companionId,
    required this.isMy,
    required this.content,
    this.files,
    required this.isRead,
    required this.created,
  });
}
