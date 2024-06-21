import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkedin_demo/views/profile_page.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import '../utils/colors.dart';
import '../viewModels/user_viewmodel.dart';
import '../widgets/app_bar/backbutton_appbar.dart';
import '../widgets/common_icon.dart';
import '../widgets/common_text.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        leadingIcon: const customIcon(icon: Icons.arrow_back_ios_rounded, color: Colors.black),
        onLeadingPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: Padding(
        padding: EdgeInsets.all(16.h),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 25.h,bottom: 28.h ),
              child: Align(
                alignment: Alignment.center,
                child: commonText(
                    'Welcome Back',
                    fontSizeFactor: 24.sp,
                    fontWeight: FontWeight.w500,
                    color: black
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.h,bottom: 8.h ),
              child: Align(
                alignment: Alignment.topLeft,
                child: commonText(
                    'E-mail or Phone',
                    fontSizeFactor: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: blackB
                ),
              ),
            ),
            commonTextField(
              decoration: inputDecoration(hint: 'Enter Email or Phone'),
              suffixIcon: const Icon(
                Icons.person_outline_sharp,
              ),
              textFieldType: TextFieldType.EMAIL,
              keyboardType: TextInputType.name,
              isPassword: false,
              controller: emailController,
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.h,bottom: 8.h ),
              child: Align(
                alignment: Alignment.topLeft,
                child: commonText(
                    'Password(6 characters minimum)',
                    fontSizeFactor: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: black
                ),
              ),
            ),
            commonTextField(
              decoration: inputDecoration(hint: 'Enter Password'),
              textFieldType: TextFieldType.PASSWORD,
              isPassword: true,
              keyboardType:
              TextInputType.visiblePassword,
              controller: passwordController,
            ),

            Padding(
              padding: EdgeInsets.only(top: 25.h,bottom: 8.h ),
              child: CurvedEdgeButton(
                text: 'Sign in',
                onPressed: () async {
                  final email = emailController.text;
                  final password = passwordController.text;
                  final userViewModel = Provider.of<UserViewModel>(context, listen: false);
                  await userViewModel.signInButtonPress(context, email, password);
                },
                backgroundColor: Colors.blue,
                borderRadius: 30,
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 50.w),
              ),
            ),
          ],
        ),
      ),
    );
  }
}