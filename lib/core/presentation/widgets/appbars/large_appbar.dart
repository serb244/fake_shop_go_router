import 'package:flutter/material.dart';

class LargeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LargeAppBar({
    super.key,
    required this.title,
    this.actions,
  });

  final String title;
  final Widget? actions;

  static const double _appbarHeight = 120.0;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      automaticallyImplyLeading: false,
      shadowColor: Colors.transparent,
      toolbarHeight: _appbarHeight,
      actions: [
        actions ?? const SizedBox.shrink(),
        const SizedBox(width: 16.0),
      ],
      title: Text(title, style: Theme.of(context).textTheme.bodyLarge),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(_appbarHeight);
}
