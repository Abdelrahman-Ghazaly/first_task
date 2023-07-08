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
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        label: Text(label),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefix: Padding(
          padding: const EdgeInsets.only(right: kDeafultPadding / 2),
          child: Icon(icon),
        ),
        hintText: hintText,
      ),
    );
  }
}
