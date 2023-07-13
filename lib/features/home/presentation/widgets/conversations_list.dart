import 'package:first_assignment/features/home/presentation/cubit/friend_cubit/friend_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        BlocBuilder<FriendCubit, FriendState>(
          builder: (context, state) {
            if (state is Success) {
              return Column(
                children: List.generate(
                  state.friendEntities.length,
                  (index) {
                    return MessageBox(
                      friendEntity: state.friendEntities[index],
                    );
                  },
                ),
              );
            } else if (state is Error) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        // Consumer<FriendsProvider>(
        //   builder: (context, value, child) {
        //     if (value.friendEntities.isEmpty) {
        //       return const CircularProgressIndicator();
        //     } else {
        //       return Column(
        //         children: List.generate(
        //           value.friendEntities.length,
        //           (index) {
        //             return MessageBox(
        //               friendEntity: value.friendEntities[index],
        //             );
        //           },
        //         ),
        //       );
        //     }
        //   },
        // )
      ],
    );
  }
}
