import '../models/profile_model.dart';

class ProfileService {
  List<ProfileUserModel> getUsers() {
    return [
      ProfileUserModel(name: "Tony Antonio",
        position: "Android Dev at",
        profileImageUrl: "lib/assets/profile_images/user_img_1.jpg",
        time: '1w',
        rank: '2nd',
        otherInfo: 'Edited',
        location: 'Nixo'

      ),
      ProfileUserModel(
        name: "Andy Orton",
        position: "Web Dev at",
        profileImageUrl: "lib/assets/profile_images/user_img_2.jpeg",
        time: '2w',
        rank: '1st',
        location: 'Mixo',
        otherInfo: 'Edited',

      ),
      ProfileUserModel(
        name: "Tony Antonio",
        position: "Android Dev at",
        profileImageUrl: "lib/assets/profile_images/user_img_3.jpg",
        time: '2w',
        rank: '1st',
        otherInfo: 'Edited',
        location: 'Mixo',
      ),
      ProfileUserModel(
        name: "Andy Orton",
        position: "Web Dev at",
        profileImageUrl: "lib/assets/profile_images/user_img_4.jpg",
        time: '2w',
        rank: '1st',
        otherInfo: 'Not Edited',
        location: 'Mixo',
      ),
      ProfileUserModel(
        name: "Tony Antonio",
        position: "Android Dev at",
        profileImageUrl: "lib/assets/profile_images/user_img_5.jpeg",
        time: '2w',
        rank: '1st',
        otherInfo: 'Edited',
        location: 'Mixo',
      ),
      ProfileUserModel(
        name: "Andy Orton",
        position: "Web Dev at",
        profileImageUrl: "lib/assets/profile_images/user_img_6.jpeg",
        time: '2w',
        rank: '1st',
        otherInfo: 'Not Edited',
        location: 'Mixo',
      ),
      ProfileUserModel(
        name: "Tony Antonio",
        position: "Android Dev at",
        profileImageUrl: "lib/assets/profile_images/user_img_7.jpeg",
        time: '2w',
        rank: '1st',
        otherInfo: 'Not Edited',
        location: 'Mixo',
      ),
      ProfileUserModel(
        name: "Andy Orton",
        position: "Web Dev at",
        profileImageUrl: "lib/assets/profile_images/user_img_8.jpeg",
        time: '2w',
        rank: '1st',
        otherInfo: 'Not Edited',
        location: 'Mixo',
      ),
    ];
  }
}
