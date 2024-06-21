import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/colors.dart';

//Home Page Three horizontal lines
class ThreeHorizontalLines extends StatelessWidget {
  const ThreeHorizontalLines({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: (1.2).h,
          width: 18.w,
          color: dbCustomColor,
        ),
        const SizedBox(width: 10),
        Container(
          height: (1.2).h,
          width: 18.w,
          color: dlbCustomColor,
        ),
        const SizedBox(width: 10),
        Container(
          height: (1.2).h,
          width: 18.w,
          color: dlbCustomColor,
        ),
      ],
    );
  }
}
