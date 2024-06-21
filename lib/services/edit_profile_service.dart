import '../models/edit_user_profile.dart';

class EditProfileService {
  UserProfileModel getUserProfile() {
    return UserProfileModel(
      name: 'Stebin Alex',
      description: 'Talks about #swift, #swiftui, and #iosdevelopment',
      role: 'Freelance iOS Developer | UIKIt | SwiftUI | ',
      company: 'LEAN TRANSITION SOLUTIONS - LTS',
      location: 'Thiruvananthapuram, Kerala, India',
      profileImageUrl: 'lib/assets/profile_images/user_img_1.jpg',
      backgroundImageUrl: 'lib/assets/common_images/linkedin_bg.jpeg',
      followers: 4413,
      connections: 500,
    );
  }

  UserDashboardModel getUserDashboard() {
    return UserDashboardModel(
      profileViews: 111,
      postViews: 500,
      searchAppearances: 85,
    );
  }
}
