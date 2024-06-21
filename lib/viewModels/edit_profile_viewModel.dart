import 'package:flutter/material.dart';
import '../models/edit_user_profile.dart';
import '../services/edit_profile_service.dart';




class EditProfileViewModel extends ChangeNotifier {
  UserProfileModel? userProfile;
  UserDashboardModel? userDashboard;

  EditProfileViewModel() {
    _loadProfileData();
  }

  void _loadProfileData() {
    userProfile = EditProfileService().getUserProfile();
    userDashboard = EditProfileService().getUserDashboard();
    notifyListeners();
  }
}
