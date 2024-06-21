import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';
import '../views/profile_page.dart';

class UserViewModel extends ChangeNotifier {
  UserModel? _currentUser;
  final AuthenticationService _authenticationService = AuthenticationService();

  UserViewModel() {
    checkForStoredCredentials();
  }

  UserModel? get currentUser => _currentUser;

  Future<void> signupUser(String email, String password) async {
    await _authenticationService.signUp(email, password);
    _currentUser = UserModel(email: email, password: password);
    await _authenticationService.saveCredentials(email, password);
    notifyListeners();
  }

  Future<void> loginUser(String email, String password) async {
    bool success = await _authenticationService.login(email, password);
    if (success) {
      _currentUser = UserModel(email: email, password: password);
      await _authenticationService.saveCredentials(email, password);
      notifyListeners();
    } else {
      // Handle login failure
      _currentUser = null;
    }
  }

  Future<void> logoutUser() async {
    await _authenticationService.logout();
    _currentUser = null;
    notifyListeners();
  }

  Future<void> checkForStoredCredentials() async {
    String? email = await _authenticationService.getEmail();
    String? password = await _authenticationService.getPassword();
    if (email != null && password != null) {
      await loginUser(email, password);
    }
  }

  Future<void> handleSignupButtonPress(BuildContext context, String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter email and password')),
      );
      return;
    }

    if (password.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password must be at least 6 characters long')),
      );
      return;
    }

    await signupUser(email, password);

    if (currentUser != null) {
      const ProfilePage().launch(context, pageRouteAnimation: PageRouteAnimation.Fade);
    }
  }

  Future<void> signInButtonPress(BuildContext context, String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter email and password')),
      );
      return;
    }

    if (password.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password must be at least 6 characters long')),
      );
      return;
    }

    await loginUser(email, password);

    if (currentUser != null) {
      const ProfilePage().launch(context, pageRouteAnimation: PageRouteAnimation.Fade);
    }
  }
}