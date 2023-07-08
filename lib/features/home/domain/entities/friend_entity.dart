class FriendEntity {
  FriendEntity({
    required this.name,
    required this.imageUrl,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.isOnline,
  });

  final String name;
  final String imageUrl;
  final String lastMessage;
  final String lastMessageTime;
  final bool isOnline;
}
