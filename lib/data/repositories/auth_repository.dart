import 'package:flutter_application_1/data/entities/user.dart';

List<User> users = [User(email: "123", password: "123")];

class AuthRepository {
  void register(String email, String password) {
    final newUser = User(email: email, password: password);
    users.add(newUser);
  }

  User? login(String email, String password) {
    for (var user in users) {
      if (user.email == email && user.password == password) {
        return user;
      }
    }
    return null;
  }
}
