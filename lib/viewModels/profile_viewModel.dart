import 'package:flutter/material.dart';
import '../models/post_model.dart';
import '../models/profile_model.dart';
import '../services/post_service.dart';
import '../services/profile_service.dart';

class ProfileHomeViewModel extends ChangeNotifier {
  List<ProfileUserModel> users = [];
  List<PostModel> posts = [];

  final ProfileService _profileService = ProfileService();
  final PostService _postService = PostService();

  ProfileHomeViewModel() {
    _loadData();
  }

  void _loadData() {
    users = _profileService.getUsers();
    posts = _postService.getPosts(users);
    notifyListeners();
  }
}
