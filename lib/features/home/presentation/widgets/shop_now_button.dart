import 'package:first_assignment/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ShopNowButton extends StatelessWidget {
  const ShopNowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            color: AppColors.blue,
            width: 2,
          ),
        ),
      ),
      child: const Text(
        'SHOP NOW',
        style: TextStyle(
          color: AppColors.blue,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
