import 'package:linkedin_demo/models/profile_model.dart';

class PostModel {
  final ProfileUserModel user;
  final String content;
  final String postImageUrl;
  final int likes;
  final int comments;
  final String commentsT;
  final String likesT;

  PostModel({
    required this.user,
    required this.content,
    required this.postImageUrl,
    required this.likes,
    required this.comments,
    required this.commentsT,
    required this.likesT
  });
}
