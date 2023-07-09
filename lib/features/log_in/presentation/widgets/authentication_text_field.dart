import 'package:first_assignment/core/constants/constants.dart';
import 'package:flutter/material.dart';

class AuthenticationTetField extends StatelessWidget {
  const AuthenticationTetField({
    super.key,
    required this.controller,
    required this.icon,
    required this.label,
    required this.hintText,
    this.isPassword = false,
  });

  final TextEditingController controller;
  final IconData icon;
  final String label;
  final String hintText;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          height: kDeafultAppBarHeight,
          width: kScreenWidth(context),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: AppColors.grey,
                width: 1.5,
              ),
            ),
          ),
          child: Row(
            children: [
              Icon(icon),
              Expanded(
                child: TextField(
                  controller: controller,
                  obscureText: isPassword,
                  decoration: InputDecoration(
                    hintText: hintText,
                    border: InputBorder.none,
                    contentPadding:
                        const EdgeInsets.only(left: kDeafultPadding / 2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
