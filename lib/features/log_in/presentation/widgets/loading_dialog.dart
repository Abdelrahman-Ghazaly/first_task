import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: kScreenHeight(context) * 0.2,
        width: kScreenWidth(context) * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
