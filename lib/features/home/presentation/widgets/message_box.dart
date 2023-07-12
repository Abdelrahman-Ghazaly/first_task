import 'package:first_assignment/core/constants/constants.dart';
import 'package:first_assignment/features/home/domain/entities/friend_entity.dart';
import 'package:first_assignment/features/home/presentation/widgets/friend_image.dart';
import 'package:flutter/material.dart';

class MessageBox extends StatelessWidget {
  const MessageBox({
    super.key,
    required this.friendEntity,
  });

  final FriendEntity friendEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: kDeafultPadding / 2,
        ),
        SizedBox(
          height: kDeafultAppBarHeight,
          width: kScreenWidth(context),
          child: Row(
            children: [
              FriendImage(
                image: friendEntity.imageUrl,
                isOnline: friendEntity.isOnline,
              ),
              const SizedBox(
                width: kDeafultPadding / 2,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          friendEntity.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          friendEntity.lastMessageTime,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      friendEntity.lastMessage,
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
