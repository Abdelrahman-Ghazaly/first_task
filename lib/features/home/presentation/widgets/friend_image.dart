import 'package:first_assignment/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class FriendImage extends StatelessWidget {
  const FriendImage({
    super.key,
    required this.imageUrl,
    required this.isOnline,
  });
  final String imageUrl;
  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
            imageUrl,
          ),
        ),
        if (isOnline) Positioned(
                bottom: 0,
                right: 5,
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    color: AppColors.green,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.white,
                      width: 1.5,
                    ),
                  ),
                ),
              ) else Container(),
      ],
    );
  }
}
