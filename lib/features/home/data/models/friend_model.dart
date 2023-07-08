import 'package:first_assignment/features/home/domain/entities/friend_entity.dart';

class FriendModel extends FriendEntity {
  FriendModel({
    required super.name,
    required super.imageUrl,
    required super.lastMessage,
    required super.lastMessageTime,
    required super.isOnline,
  });

  factory FriendModel.fromMap(Map<String, dynamic> map) {
    return FriendModel(
      name: map['name'] ?? '',
      imageUrl: map['image'] ?? '',
      lastMessage: map['lastMessage'] ?? '',
      lastMessageTime: map['lastMessageTime'] ?? '',
      isOnline: map['isOnline'] ?? false,
    );
  }
}
