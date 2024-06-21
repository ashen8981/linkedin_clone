import 'package:flutter/material.dart';
import 'package:linkedin_demo/widgets/cards/signup_description_text.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import '../viewModels/user_viewmodel.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/common_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.h),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 15.h,bottom: 8.h ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: commonText(
                      'E-mail',
                      fontSizeFactor: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: black
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
                      fontSizeFactor: 16.sp,
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
                padding: EdgeInsets.only(top: 15.h,bottom: 8.h ),
                child: const Align(
                  alignment: Alignment.center,
                  child:  DescriptionText(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25.h,bottom: 8.h ),
                child: CurvedEdgeButton(
                  text: 'Accept and register',
                  onPressed: () async {
                    final email = emailController.text;
                    final password = passwordController.text;
                    final userViewModel = Provider.of<UserViewModel>(context, listen: false);
                    await userViewModel.handleSignupButtonPress(context, email, password);
                  },
                  backgroundColor: Colors.blue,
                  borderRadius: 30,
                  padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 50.w),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}