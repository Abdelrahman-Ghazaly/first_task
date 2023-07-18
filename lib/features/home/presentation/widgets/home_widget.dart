import 'package:flutter/material.dart';

import 'conversations_list.dart';
import 'sponser_box.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SponserBox(),
          ConversationsList(),
        ],
      ),
    );
  }
}
