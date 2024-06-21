import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkedin_demo/widgets/common_icon.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import '../utils/colors.dart';
import '../viewModels/user_viewmodel.dart';
import '../widgets/common_text.dart';
import 'edit_profile.dart';


class SideScreen extends StatefulWidget {
  const SideScreen({super.key});

  @override
  _SideScreenState createState() => _SideScreenState();
}

class _SideScreenState extends State<SideScreen> {
  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);
    return  Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: commonBlue,
            ),
            child: commonText(
              'Welcome',
              color:wCustomColor,
              fontSizeFactor: 22.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          ListTile(
            leading: const customIcon(icon: Icons.account_circle,),
            title: commonText('Profile',color: black,fontSizeFactor: 18.sp,),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileView()),
              );
            },
          ),
          // ListTile(
          //   leading: const customIcon(icon: Icons.logout,),
          //   title: commonText('Logout',color:black,fontSizeFactor: 18.sp,),
          //   onTap: ()  async {
          //     // await userViewModel.logoutUser();
          //   },
          // ),
        ],
      ),
    );
  }
}