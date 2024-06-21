import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leadingIcon;
  final VoidCallback? onLeadingPressed;
  final Color? backgroundColor;
  final double elevation;

  const CommonAppBar({
    Key? key,
    this.leadingIcon,
    this.onLeadingPressed,
    this.backgroundColor,
    this.elevation = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: elevation,
      leading: IconButton(
        icon: leadingIcon ?? Icon(Icons.arrow_back_ios_rounded),
        onPressed: onLeadingPressed ?? () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
