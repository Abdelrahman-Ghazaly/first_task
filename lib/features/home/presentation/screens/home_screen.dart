// ignore_for_file: use_build_context_synchronously

import 'package:first_assignment/core/constants/constants.dart';
import 'package:first_assignment/features/home/domain/entities/friend_entity.dart';
import 'package:first_assignment/features/home/presentation/provider/friends_provider.dart';
import 'package:first_assignment/features/home/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<FriendEntity> friendEntities =
        context.select<FriendsProvider, List<FriendEntity>>(
      (value) => value.friendEntities,
    );

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(kDeafultPadding),
          child: TabBarView(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SponserBox(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'More Conversations',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        if (friendEntities.isEmpty)
                          const CircularProgressIndicator()
                        else
                          ...List.generate(
                            friendEntities.length,
                            (index) {
                              return MessageBox(
                                friendEntity: friendEntities[index],
                              );
                            },
                          ),
                      ],
                    )
                  ],
                ),
              ),
              Container(),
              Container(),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
