import 'package:flutter/material.dart';

export 'app_assets.dart';
export 'app_colors.dart';

const double kDeafultPadding = 20;
const double kDeafultAppBarHeight = 50;
const String kDeafultErrorMessage = 'Something went wrong';

double kScreenHeight(BuildContext context) =>
    MediaQueryData.fromView(View.of(context)).size.height;
double kScreenWidth(BuildContext context) =>
    MediaQueryData.fromView(View.of(context)).size.width;
