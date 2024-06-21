import 'package:linkedin_demo/models/user_model.dart';

class UserService {
  // Private list to hold user data
  static List<UserModel> users = [
    UserModel(email: 'user1@example.com', password: 'password12'),
    UserModel(email: 'user2@example.com', password: 'password2'),
    UserModel(email: 'user3@example.com', password: 'password3'),
  ];

  // Method to get all users
  List<UserModel> getUsers() {
    return users;
  }

  // Method to add a new user
  static void addUser(UserModel user) {
    users.add(user);
  }
}
