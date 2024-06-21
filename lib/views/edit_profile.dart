import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import '../utils/colors.dart' as c;
import '../utils/colors.dart';
import '../viewModels/edit_profile_viewModel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/cards/dashboard_widget.dart';
import '../widgets/cards/horizontal_container.dart';
import '../widgets/common_icon.dart';
import '../widgets/common_text.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_container.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EditProfileViewModel(),
      child: Scaffold(

        body:SingleChildScrollView(
            child: Consumer<EditProfileViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.userProfile == null || viewModel.userDashboard == null) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Image.asset(
                          viewModel.userProfile!.backgroundImageUrl,
                          width: double.infinity,
                          height: 120.h, // Adjust the height as needed
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          left: 14.w,
                          bottom: -40.h,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(viewModel.userProfile!.profileImageUrl),
                                radius: 50,
                              ),
                              Positioned(
                                right: -5.w,
                                bottom: -5.h,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 18,
                                  child: customIcon(icon: Icons.add,
                                    color: c.blackB,
                                    size: 25.sp,),
                                ),
                              ),
                              Positioned(
                                right: -275,
                                bottom: -5,
                                child: customIcon(icon: Icons.edit,
                                  color: c.blackB,
                                  size: 26.sp,),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 65.0,bottom: 16,left: 16.0,right: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              commonText(
                                  viewModel.userProfile!.name,
                                  fontSizeFactor: 22.sp,
                                  fontWeight: FontWeight.w600,
                                  color: black,
                                  textAlign: TextAlign.start
                              ),
                              IconButton(onPressed: (){}, icon: customIcon(icon:Icons.volume_up,size: 21.sp,))
                            ],
                          ),
                          commonText(
                              viewModel.userProfile!.role,
                              fontSizeFactor: 17.sp,
                              fontWeight: FontWeight.w400,
                              color: black,
                              textAlign: TextAlign.start
                          ),
                          commonText(
                              viewModel.userProfile!.description,
                              fontSizeFactor: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: grey,
                              textAlign: TextAlign.start
                          ),
                          spacing(context,vertical: 0.02.h),
                          commonText(
                              viewModel.userProfile!.company,
                              fontSizeFactor: 17.sp,
                              fontWeight: FontWeight.w400,
                              color: black,
                              textAlign: TextAlign.start
                          ),
                          commonText(
                              viewModel.userProfile!.location,
                              fontSizeFactor: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: grey,
                              textAlign: TextAlign.start
                          ),
                          spacing(context,vertical: 0.02.h),
                          commonText(
                              '${viewModel.userProfile!.followers} followers • ${viewModel.userProfile!.connections}+ connections',
                              fontSizeFactor: 17.sp,
                              fontWeight: FontWeight.w400,
                              color: commonBlue,
                              textAlign: TextAlign.start
                          ),
                          spacing(context,vertical: 0.02.h),

                          // Open to work section
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 5.h,bottom: 8.h ),
                                child: CurvedEdgeButton(
                                  text: 'Open to',
                                  onPressed: () async {

                                  },
                                  backgroundColor: commonBlue,
                                  borderRadius: 30,
                                  padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 25.w),

                                ),
                              ),

                              spacing(context,horizontal: 0.02.w),
                              Padding(
                                padding: EdgeInsets.only(top: 5.h,bottom: 8.h ),
                                child: CurvedEdgeButton(
                                  text: 'Add Section',
                                  onPressed: () async {

                                  },
                                  backgroundColor: Colors.white,
                                  borderRadius: 30,
                                  padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 15.w),
                                  textStyle:  const TextStyle(color: Colors.grey),
                                  borderColor: Colors.grey,
                                  borderWidth: 2.0,
                                ),
                              ),
                              const Spacer(),
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: grey,
                                    width: 2.0,
                                  ),
                                ),
                                child: const CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Icon(
                                    Icons.more_horiz_outlined,
                                    color:grey,
                                  ),
                                ),
                              )

                            ],
                          ),
                          spacing(context,vertical: 0.02.h),
                          const HorizontalScrollableWidget(),
                          spacing(context,vertical: 0.04.h),
                          // Dashboard

                          Container(
                            color: blueG,
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 25.h,bottom: 18.h,left: 5.w,right: 5.w ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              commonText(
                                                  'Your Dashboard',
                                                  fontSizeFactor: 17.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: black,
                                                  textAlign: TextAlign.start
                                              ),
                                              commonText(
                                                  'Private to you      ',
                                                  fontSizeFactor: 16.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: black,
                                                  fontStyle: FontStyle.italic,
                                                  textAlign: TextAlign.start
                                              ),
                                            ],
                                          ),
                                          Row(
                                           children: [
                                             customIcon(icon: Icons.star_border,
                                               color: c.blackB,
                                               size: 26.sp,),
                                             Padding(
                                               padding:  EdgeInsets.only(left: 4.h,right: 2.h),
                                               child: commonText(
                                                   'All Star',
                                                   fontSizeFactor: 17.sp,
                                                   fontWeight: FontWeight.w400,
                                                   color: black,
                                                   textAlign: TextAlign.start
                                               ),
                                             ),
                                           ],
                                         )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 80.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: wCustomColor,
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(top: 15.h),
                                              child: DashboardItem(
                                                title: 'Who viewed\n your profile',
                                                count: viewModel.userDashboard!.profileViews,
                                              ),
                                            ),
                                            Container(
                                              width: 1,
                                              color: Colors.grey,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 15.h),
                                              child: DashboardItem(
                                                title: 'Post views',
                                                count: viewModel.userDashboard!.postViews,
                                              ),
                                            ),
                                            Container(
                                              width: 1,
                                              color: Colors.grey,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 15.h),
                                              child: DashboardItem(
                                                title: 'Search\n appearances',
                                                count: viewModel.userDashboard!.searchAppearances,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10.w,right: 10.w,top: 20.h,bottom: 20.h ),
                                      child: Container(
                                        width: context.width(),
                                        height: 80.h,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color:wCustomColor
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 10.h,left: 5.w,right: 5.w ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              customIcon(icon: Icons.wifi_tethering_sharp,
                                                color: c.blackB,
                                                size: 26.sp,),
                                              Padding(
                                                padding:  EdgeInsets.only(left: 6.h,right: 2.h),
                                                child: commonText(
                                                    'Creator Mode: On',
                                                    fontSizeFactor: 17.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: black,
                                                    textAlign: TextAlign.start
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ),
                                    ),],
                                ),
                                Positioned(
                                  top: -30.h,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    height: 40.h,
                                    color: greyL,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
      ),
    );
  }
}


