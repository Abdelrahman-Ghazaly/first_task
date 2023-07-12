import 'dart:typed_data';

class FriendEntity {
  FriendEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.isOnline,
  });

  final int id;
  final String name;
  final Uint8List imageUrl;
  final String lastMessage;
  final String lastMessageTime;
  final bool isOnline;
}
