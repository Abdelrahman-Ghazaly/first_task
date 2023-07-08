import 'package:first_assignment/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialMediaIcons extends StatelessWidget {
  const SocialMediaIcons({
    super.key,
    required this.icon,
    this.isGoogle = false,
  });

  final String icon;
  final bool isGoogle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDeafultPadding / 2),
      child: isGoogle
          ? Container(
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(kDeafultPadding / 2),
                child: SvgPicture.asset(
                  icon,
                  height: 35,
                  width: 35,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            )
          : SvgPicture.asset(
              icon,
              height: 65,
              width: 65,
            ),
    );
  }
}
