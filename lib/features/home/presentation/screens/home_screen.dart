// ignore_for_file: use_build_context_synchronously

import 'package:first_assignment/core/constants/constants.dart';
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
    await context.read<FriendsProvider>().getFriends();
    await context.read<SponserProvider>().getSponser();
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
                    )
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
