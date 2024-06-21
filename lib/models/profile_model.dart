
class ProfileUserModel {
  final String name;
  final String position;
  final String profileImageUrl;
  final String time;
  final String rank;
  final String otherInfo;
  final String? location;

  ProfileUserModel({
    required this.name,
    required this.position,
    required this.profileImageUrl,
    required this.time,
    required this.rank,
    required this.otherInfo,
    this.location,
  });
}


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
