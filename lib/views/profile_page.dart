import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import '../utils/colors.dart' as c;
import '../utils/colors.dart';
import '../viewModels/profile_viewModel.dart';
import '../viewModels/user_viewmodel.dart';
import '../widgets/bottom_nav_bar/bottom_navbar.dart';
import '../widgets/common_icon.dart';
import '../widgets/common_text.dart';
import '../widgets/app_bar/custom_appbar.dart';
import '../widgets/custom_container.dart';
import '../widgets/custom_textfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<ProfileHomeViewModel>(context);

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 14.w,right: 14.w,top: 1.h,bottom: 1.h),
            child:  commonTextField(
              decoration: inputDecoration(hint: 'Try "Android Dev"',
                  prefixIcon:Icons.search),
              suffixIcon: const Icon(
                Icons.qr_code_scanner_outlined,
                color:  bg1Color,
              ),
              textFieldType: TextFieldType.EMAIL,
              keyboardType: TextInputType.name,
              isPassword: false,
              controller: textController,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 14.w,right: 14.w,top: 1.h,bottom: 1.h),
            child: SizedBox(
              height: 90.h, // Increased height to provide extra space for the icon
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: viewModel.users.length,
                itemBuilder: (context, index) {
                  var user = viewModel.users[index];
                  return Padding(
                    padding: EdgeInsets.only(left: 9.w),
                    child: Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none, // Ensures the icon is not clipped
                          children: [
                            CommonContainer(
                              width: 50.w,
                              height: 50.h,
                              imagePath: user.profileImageUrl,
                            ),
                            if (index == 0)
                              Positioned(
                                bottom: -5.h, // Adjusted to ensure it is within bounds
                                right: -5.w, // Adjusted to ensure it is within bounds
                                child: CircleAvatar(
                                  backgroundColor: commonBlue,
                                  radius: 15,
                                  child: customIcon(
                                    icon: Icons.add,
                                    size: 20.w,
                                    color: wCustomColor,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
          ,
          Expanded(
            child: ListView.builder(
              itemCount: viewModel.posts.length,
              itemBuilder: (context, index) {
                var post = viewModel.posts[index];
                return Card(
                  margin: EdgeInsets.only(left: 10.w,right: 10.w,top: 10.h,bottom: 10.h),
                  child: Padding(
                    padding: EdgeInsets.only(left: 14.w,right: 14.w,top: 1.h,bottom: 1.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            radius: 30.0,
                            backgroundImage: AssetImage(post.user.profileImageUrl,
                            ),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              commonText(
                                "${post.user.name} . ",
                                color: c.bCustomColor,
                                fontSizeFactor: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),
                              commonText(
                                post.user.rank,
                                color: c.bCustomColor,
                                fontSizeFactor: 11.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  commonText(
                                    "${post.user.position} ",
                                    color: c.bCustomColor,
                                    fontSizeFactor: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  commonText(
                                    post.user.location ?? " ",
                                    color: c.bCustomColor,
                                    fontSizeFactor: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ],
                              ),
                              spacing(context,vertical: 0.004.h),
                              commonText(
                                '${post.user.time} . ${post.user.otherInfo}',
                                  color: c.bCustomColor,
                                 fontSizeFactor: 12.sp,
                                  fontWeight: FontWeight.normal,
                              ),
                            ],
                          ),
                          trailing: customIcon(icon:Icons.more_vert,size: 22.sp,color:c.bCustomColor),
                        ),
                        spacing(context, vertical: 0.01.h),
                        commonText(post.content,
                            fontSizeFactor: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: c.bCustomColor
                        ),
                        if (post.postImageUrl.isNotEmpty)
                          Padding(
                            padding: EdgeInsets.only(top: 12.h,bottom: 12.h),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Image.asset(
                                post.postImageUrl,
                                width: 500.w,
                                height: 140.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                        Padding(
                          padding: EdgeInsets.only(top: 12.h,bottom: 12.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                commonText(post.likesT,
                                    fontSizeFactor: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: black
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    commonText('${post.comments}',
                                        fontSizeFactor: 13.sp,
                                        fontWeight: FontWeight.w600,
                                        color: black
                                    ),
                                    spacing(context, horizontal: 0.015.w),
                                    commonText(post.commentsT,
                                        fontSizeFactor: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: black
                                    ),
                                  ],
                                ),
                              ],),
                              spacing(context, vertical: 0.015.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      customIcon(
                                          icon: Icons.thumb_up_alt_outlined,
                                        color: iconPPColor,
                                        size: 24.sp,
                                      ),
                                      spacing(context, horizontal: 0.045.w),
                                      customIcon(icon: Icons.comment_outlined,
                                        color: iconPPColor,
                                        size: 24.sp,),
                                      spacing(context, horizontal: 0.045.w),
                                      customIcon(icon: FontAwesomeIcons.share,
                                        color:iconPPColor,
                                        size: 24.sp,),
                                    ],
                                  ),

                                  Row(
                                    children: [
                                      customIcon(icon: Icons.bookmark,
                                        color: iconPPColor,
                                        size: 24.sp,),

                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: c.bCustomColor,
        tooltip: 'Increment',
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        onPressed: (){},
        child:  Icon(Icons.add, color: Colors.white, size: 24.sp),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CommonBottomNavigationBar(),
    );
  }
}

