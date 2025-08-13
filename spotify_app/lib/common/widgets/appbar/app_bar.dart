import 'package:flutter/material.dart';
import 'package:spotify_app/common/helpers/is_dark_mode.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final IconData? leadingIcon;
  final Function? onLeadingPressed;
  final double? iconSize;

  const BasicAppBar({
    super.key,
    this.title,
    this.leadingIcon = Icons.arrow_back_ios_new,
    this.onLeadingPressed,
    this.iconSize = 15,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: title ?? Text(''),
      centerTitle: true,
      leading: IconButton(
        onPressed: () => onLeadingPressed,
        icon: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: context.isDarkMode
                ? Colors.white.withValues(alpha: 0.03)
                : Colors.black.withValues(alpha: 0.04),
            shape: BoxShape.circle,
          ),
          child: Icon(
            leadingIcon,
            size: iconSize,
            color: context.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
