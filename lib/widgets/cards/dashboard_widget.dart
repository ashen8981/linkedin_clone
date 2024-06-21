import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../utils/colors.dart';
import '../common_text.dart';

//edit profile page 3 divided card
class DashboardItem extends StatelessWidget {
  final String title;
  final int count;

  const DashboardItem({super.key, required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonText(
          count.toString(),
          fontSizeFactor: 21.sp,
          fontWeight: FontWeight.w800,
          color: commonBlue,
          textAlign: TextAlign.start,
        ),
        commonText(
          title,
          fontSizeFactor: 11.sp,
          fontWeight: FontWeight.w400,
          color: black,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}

