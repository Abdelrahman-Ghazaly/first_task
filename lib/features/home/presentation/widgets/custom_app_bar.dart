import 'package:first_assignment/core/constants/constants.dart';
import 'package:first_assignment/features/home/presentation/widgets/custom_tab_bar.dart';
import 'package:first_assignment/features/log_in/presentation/cubit/log_in_cubit.dart';
import 'package:first_assignment/features/log_in/presentation/provider/log_in_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        //   child: Consumer<LogInProvider>(
        //     builder: (context, value, child) {
        //       final imageUrl = value.userEntity?.imageUrl;
        //       late ImageProvider imageWidget;
        //       if (imageUrl == null) {
        //         imageWidget = const AssetImage(AppImages.deafultProfile);
        //       } else {
        //         imageWidget = NetworkImage(imageUrl);
        //       }
        //       return Container(
        //         height: 20,
        //         width: 20,
        //         decoration: BoxDecoration(
        //           shape: BoxShape.circle,
        //           image: DecorationImage(
        //             image: imageWidget,
        //           ),
        //         ),
        //       );
        //     },
        //   ),
        child: BlocBuilder<LogInCubit, LogInState>(
          builder: (context, state) {
            late ImageProvider imageProvider;
            if (state is Success) {
              imageProvider = NetworkImage(state.userEntity.imageUrl);
            } else if (state is Error) {
              imageProvider = const AssetImage(AppImages.deafultProfile);
            } else {
              return const CircularProgressIndicator();
            }
            return Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: imageProvider,
                ),
              ),
            );
          },
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
