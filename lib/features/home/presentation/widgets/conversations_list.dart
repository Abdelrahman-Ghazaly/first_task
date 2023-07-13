import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/friends_provider.dart';
import 'message_box.dart';

class ConversationsList extends StatelessWidget {
  const ConversationsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'More Conversations',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Consumer<FriendsProvider>(
          builder: (context, value, child) {
            if (value.friendEntities.isEmpty) {
              return const CircularProgressIndicator();
            } else {
              return Column(
                children: List.generate(
                  value.friendEntities.length,
                  (index) {
                    return MessageBox(
                      friendEntity: value.friendEntities[index],
                    );
                  },
                ),
              );
            }
          },
        )
      ],
    );
  }
}
