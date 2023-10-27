import 'package:flutter/material.dart';

import '../../../constants/sizes.dart';

class SmallAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SmallAppBar({
    super.key,
    required this.title,
    this.action,
    this.automaticallyImplyLeading = false,
    this.showDefaultButtons = true,
    this.showMenuButton = true,
  });

  final String title;
  final Widget? action;
  final bool automaticallyImplyLeading;
  final bool showDefaultButtons;
  final bool showMenuButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      shadowColor: Colors.transparent,
      leadingWidth: Sizes.appbarSmallLeadingWidth,
      automaticallyImplyLeading: automaticallyImplyLeading,
      toolbarHeight: Sizes.appbarSmallHeight,
      leading: automaticallyImplyLeading
          ? TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Row(
                children: [
                  Icon(Icons.arrow_back),
                  SizedBox(width: Sizes.sizedBoxWidthNormal),
                  Text('Back'),
                ],
              ),
            )
          : null,
      actions: [
        if (showMenuButton)
          IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
        action ?? const SizedBox.shrink(),
        // showDefaultButtons ? const DefaultAppbarActions() : const SizedBox.shrink()
      ],
      title: SizedBox(
        width: Sizes.appbarSmallTitleWidth,
        height: Sizes.appbarSmallHeight,
        child: Text(
          title,
          maxLines: Sizes.appbarSmallTitleMaxLines,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(Sizes.appbarSmallHeight);
}
