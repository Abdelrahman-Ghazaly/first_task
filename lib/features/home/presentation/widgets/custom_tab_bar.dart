import 'package:first_assignment/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      tabs: [
        Tab(
          child: Text(
            'Messages',
            style: TextStyle(
              color: AppColors.blue,
            ),
          ),
        ),
        Tab(
          child: Text(
            'Active',
            style: TextStyle(
              color: AppColors.blue,
            ),
          ),
        ),
        Tab(
          child: Text(
            'Groups',
            style: TextStyle(
              color: AppColors.blue,
            ),
          ),
        ),
        Tab(
          child: Text(
            'Calls',
            style: TextStyle(
              color: AppColors.blue,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kDeafultAppBarHeight);
}
