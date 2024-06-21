import 'package:flutter/material.dart';


class customIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;

  const customIcon({
    Key? key,
    required this.icon,
    this.color = Colors.black,
    this.size = 24.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: color,
      size: size,
    );
  }
}
