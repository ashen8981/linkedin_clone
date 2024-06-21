import 'package:flutter/material.dart';
import '../views/login_page.dart';
import '../views/signup_page.dart';

class HomeViewModel extends ChangeNotifier {
  void navigateToSignup(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignupPage()),
    );
  }

  void navigateToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}
