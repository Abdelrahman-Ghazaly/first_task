import 'package:first_assignment/core/constants/constants.dart';
import 'package:first_assignment/features/home/presentation/widgets/custom_tab_bar.dart';
import 'package:first_assignment/features/log_in/presentation/provider/log_in_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kDeafultAppBarHeight * 2);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDeafultPadding / 2),
        child: Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(
                  context.watch<LogInProvider>().userEntity?.imageUrl ?? ''),
            ),
          ),
        ),
      ),
      centerTitle: true,
      title: Container(
        height: kDeafultAppBarHeight - 10,
        decoration: BoxDecoration(
          color: const Color(0xFFe8e8ea),
          borderRadius: BorderRadius.circular(15),
        ),
        child: const TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding:
                EdgeInsets.symmetric(horizontal: kDeafultPadding / 2),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            label: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.search,
                  color: AppColors.grey,
                ),
                Text('Search'),
              ],
            ),
          ),
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kDeafultPadding / 2),
          child: Icon(
            CupertinoIcons.square_pencil,
            color: AppColors.grey,
            size: 50,
          ),
        )
      ],
      bottom: const CustomTabBar(),
    );
  }
}
