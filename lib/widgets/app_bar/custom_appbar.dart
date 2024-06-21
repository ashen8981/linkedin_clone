import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../views/edit_profile.dart';
import '../image_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Stack(
        children: [
          Center(
            child: Padding(
              padding:  EdgeInsets.only(left: 50.w),
              child: CommonImage(
                imagePath: 'lib/assets/common_images/linkedin_img_2.png',
                height: 50.h,
                width: 140.w,
              ),
            ),
          ),
          Positioned(
            top: 10.h,
            child: const CircleAvatar(
              backgroundImage: AssetImage('lib/assets/profile_images/user_img_1.jpg'),
              radius: 16, // Adjust the size as needed
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_on_sharp, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileView()),
            );
          },
        ),
      ],
    );
  }
}
