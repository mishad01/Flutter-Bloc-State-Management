import 'package:crud_app_using_bloc/core/theme/app_colors.dart';
import 'package:crud_app_using_bloc/utils/app_navigator.dart';
import 'package:flutter/material.dart';

AppBar appBarBuilder(
  BuildContext context,
  String? title, {
  IconData? icon,
  Widget? view,
  VoidCallback? onTap, // <-- New optional callback
}) {
  return AppBar(
    backgroundColor: AppColors.appThemeColor,
    iconTheme: IconThemeData(color: AppColors.appWhiteColor),
    title: Text(
      title ?? "",
      style: TextStyle(color: AppColors.appWhiteColor),
    ),
    actions: [
      if (icon != null)
        IconButton(
          onPressed: onTap ??
              () {
                if (view != null) {
                  AppNavigator.pushTo(context, view);
                }
              },
          icon: Icon(icon),
        ),
    ],
  );
}
