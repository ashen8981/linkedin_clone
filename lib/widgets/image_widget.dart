import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonImage extends StatelessWidget {
  final String imagePath;
  final double height;
  final double width;

  const CommonImage({
    Key? key,
    required this.imagePath,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      height: height.h,
      width: width.w,
    );
  }
}
