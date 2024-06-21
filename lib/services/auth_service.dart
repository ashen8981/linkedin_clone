import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:linkedin_demo/services/user_service.dart';
import '../models/user_model.dart';


class AuthenticationService {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Future<void> signUp(String email, String password) async {
    UserService.addUser(UserModel(email: email, password: password));
    await saveCredentials(email, password);
  }

  Future<bool> login(String email, String password) async {
    String? storedEmail = await _secureStorage.read(key: 'email');
    String? storedPassword = await _secureStorage.read(key: 'password');

    for (var user in UserService.users) {
      if (user.email == email && user.password == password) {
        return true;
      }
    }

    if (storedEmail == email && storedPassword == password) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> logout() async {
    await _secureStorage.delete(key: 'email');
    await _secureStorage.delete(key: 'password');
  }

  Future<String?> getEmail() async {
    return await _secureStorage.read(key: 'email');
  }

  Future<String?> getPassword() async {
    return await _secureStorage.read(key: 'password');
  }

  Future<void> saveCredentials(String email, String password) async {
    await _secureStorage.write(key: 'email', value: email);
    await _secureStorage.write(key: 'password', value: password);
  }
}