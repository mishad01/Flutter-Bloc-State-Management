import 'package:flutter/material.dart';

class AppBarBuild extends StatelessWidget implements PreferredSizeWidget {
  const AppBarBuild({
    super.key,
    required this.title,
    this.icon1,
    this.icon2,
    this.onPressed1,
    this.onPressed2,
  });
  final String title;
  final IconData? icon1;
  final IconData? icon2;
  final VoidCallback? onPressed1;
  final VoidCallback? onPressed2;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.teal,
      actions: [
        IconButton(
          onPressed: onPressed1,
          icon: Icon(
            icon1,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: onPressed2,
          icon: Icon(
            icon2,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
