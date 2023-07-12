import 'dart:typed_data';

import 'package:first_assignment/features/home/domain/entities/friend_entity.dart';

class FriendModel extends FriendEntity {
  FriendModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.lastMessage,
    required super.lastMessageTime,
    required super.isOnline,
  });

  factory FriendModel.fromMap(Map<String, dynamic> map) {
    dynamic isOnline = map['isOnline'];
    if (isOnline.runtimeType == int) {
      isOnline = isOnline == 1 ? true : false;
    }

    return FriendModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      imageUrl: map['image'],
      lastMessage: map['lastMessage'] ?? '',
      lastMessageTime: map['lastMessageTime'] ?? '',
      isOnline: isOnline ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': imageUrl,
      'lastMessage': lastMessage,
      'lastMessageTime': lastMessageTime,
      'isOnline': isOnline,
    };
  }
}
