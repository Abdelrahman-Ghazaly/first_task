// ignore_for_file: use_build_context_synchronously

import 'package:first_assignment/core/constants/constants.dart';
import 'package:first_assignment/features/home/presentation/cubit/friend_cubit/friend_cubit.dart';
import 'package:first_assignment/features/home/presentation/cubit/sponser_cubit/sponser_cubit.dart';
import 'package:first_assignment/features/home/presentation/provider/friends_provider.dart';
import 'package:first_assignment/features/home/presentation/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlite_viewer/sqlite_viewer.dart';

import '../provider/sponser_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    _getData();
    super.initState();
  }

  Future<void> _getData() async {
    // await context.read<FriendsProvider>().getFriends();
    // await context.read<SponserProvider>().getSponser();

    await context.read<FriendCubit>().getFriends();
    await context.read<SponserCubit>().getSponser();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(kDeafultPadding),
          child: TabBarView(
            children: [
              const SingleChildScrollView(
                child: Column(
                  children: [
                    SponserBox(),
                    ConversationsList(),
                  ],
                ),
              ),
              Center(
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (_) => const DatabaseList()));
                  },
                ),
              ),
              Container(),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
