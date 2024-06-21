import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../utils/colors.dart';
import '../viewModels/home_viewModel.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_container.dart';
import '../widgets/image_widget.dart';
import '../widgets/common_text.dart';
import '../widgets/cards/three_lines.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<HomeViewModel>(context, listen: false);
    const String description = 'Connect, Apply and Get Hired with your\n favorite job around the world.';

    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(top: 16.w,left: 16.w,right: 16.w,bottom: 16.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CommonImage(
                      imagePath: 'lib/assets/common_images/linkedin_img_2.png',
                      height: 80.h,
                      width: 140.w,
                    ),
                    CommonImage(
                      imagePath: 'lib/assets/common_images/linkedin_img_1.png',
                      height: 160.h,
                      width: 280.w,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50.h,bottom:30.h ),
                      child: Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: const BoxDecoration(
                          color: bCustomColor,  // Background color for the icon
                          shape: BoxShape.circle,  // Circular shape for the background
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_right_alt_rounded,
                            size: 24.sp,
                            color: Colors.white,  // Icon color
                          ),
                        ),
                      ),
                    ),
                    commonText(
                      'Land your Job',
                      fontSizeFactor: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: bgCustomColor
                    ),
                    spacing(context, vertical: 0.02),
                    commonText(
                      description,
                      fontSizeFactor: 14.sp,
                        fontWeight: FontWeight.w500,
                      color: gwCustomColor,
                      textAlign: TextAlign.center
                    ),
                    spacing(context, vertical: 0.02),
                    Padding(
                      padding: EdgeInsets.only(top: 30.h,bottom:30.h ),
                      child: const ThreeHorizontalLines(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          text: 'Sign Up',
                          onPressed: () => viewModel.navigateToSignup(context),
                          minimumSize: Size(140.w, 50.h),
                          initialColor: wCustomColor,
                        ),
                        spacing(context, horizontal: 0.05),
                        CustomButton(
                          text: 'Log In',
                          onPressed: () => viewModel.navigateToLogin(context),
                          minimumSize: Size(140.w, 50.h),
                          initialColor: bCustomColor,
                        ),
                      ],
                    ),
                    spacing(context, vertical: 0.02),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
