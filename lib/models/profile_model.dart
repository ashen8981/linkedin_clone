
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


