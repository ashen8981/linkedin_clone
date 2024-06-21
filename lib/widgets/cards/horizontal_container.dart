import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/colors.dart';
import '../common_icon.dart';
import '../common_text.dart';

class HorizontalScrollableWidget extends StatelessWidget {
  const HorizontalScrollableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          2, // Number of items (columns) you want horizontally scrollable
              (index) => Padding(
            padding: EdgeInsets.only(right: index < 1 ? 10.w : 0), // Add padding to all items except the last one
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.3,
                height: 120,
                color: greyL,
                child: Padding(
                  padding: EdgeInsets.only(left: 14.w, right: 14.w, top: 1.h, bottom: 1.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          commonText(
                            'Open to work',
                            fontSizeFactor: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: blackB,
                          ),
                          const Spacer(),
                          customIcon(
                            icon: Icons.edit,
                            color: blackB,
                            size: 24.sp,
                          ),
                        ],
                      ),
                      commonText(
                        'iOS Developer roles',
                        fontSizeFactor: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: blackB,
                      ),
                      commonText(
                        'See all details',
                        fontSizeFactor: 11.sp,
                        fontWeight: FontWeight.w500,
                        color: commonBlue,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
