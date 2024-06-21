
class UserProfileModel {
  final String name;
  final String description;
  final String role;
  final String company;
  final String location;
  final String profileImageUrl;
  final String backgroundImageUrl;
  final int followers;
  final int connections;

  UserProfileModel({
    required this.name,
    required this.description,
    required this.role,
    required this.company,
    required this.location,
    required this.profileImageUrl,
    required this.backgroundImageUrl,
    required this.followers,
    required this.connections,
  });
}


