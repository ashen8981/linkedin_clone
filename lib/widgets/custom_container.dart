import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/colors.dart';


Widget spacing(BuildContext context, {double? vertical, double? horizontal}) {
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;

  if (vertical != null && horizontal != null) {
    return SizedBox(
      height: screenHeight * vertical,
      width: screenWidth * horizontal,
    );
  } else if (vertical != null) {
    return SizedBox(height: screenHeight * vertical);
  } else if (horizontal != null) {
    return SizedBox(width: screenWidth * horizontal);
  } else {
    return const SizedBox.shrink();
  }
}


class CommonContainer extends StatelessWidget {
  final double width;
  final double height;
  final String imagePath;
  final double borderRadius;
  final double borderWidth;
  final Color borderColor;
  final double outerBorderWidth;
  final Color outerBorderColor;
  final IconData? icon;
  final Color iconColor;

  const CommonContainer({
    Key? key,
    required this.width,
    required this.height,
    required this.imagePath,
    this.borderRadius = 50.0,
    this.borderWidth = 2.0,
    this.borderColor = wCustomColor,
    this.outerBorderWidth = 3.0,
    this.outerBorderColor = Colors.blue,
    this.icon,
    this.iconColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius + outerBorderWidth),
        border: Border.all(
          color: outerBorderColor,
          width: outerBorderWidth,
        ),
      ),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: borderColor,
            width: borderWidth,
          ),
        ),
      ),
    );
  }
}





