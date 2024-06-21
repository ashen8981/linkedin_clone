import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkedin_demo/viewModels/home_viewModel.dart';
import 'package:linkedin_demo/viewModels/profile_viewModel.dart';
import 'package:linkedin_demo/viewModels/user_viewmodel.dart';
import 'package:linkedin_demo/widgets/bottom_nav_bar/bottom_navbar.dart';
import 'package:provider/provider.dart';
import 'views/home_page.dart';
import 'views/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => UserViewModel()),
          ChangeNotifierProvider(create: (context) => HomeViewModel()),
          ChangeNotifierProvider(create: (context) => ProfileHomeViewModel()),
          ChangeNotifierProvider(create: (context) => NavigationViewModel()),
        ],
        child: MaterialApp(
          title: 'LinkedIn Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          home: Consumer<UserViewModel>(
            builder: (context, userViewModel, child) {
              if (userViewModel.currentUser != null) {
                return const ProfilePage();
              } else {
                return const HomePage();
              }
            },
          ),
        ),
      ),
    );
  }
}
