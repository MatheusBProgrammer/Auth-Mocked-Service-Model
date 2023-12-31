import 'dart:io';

import '../models/app_user.dart';
import 'auth_mock_service.dart';

abstract class AuthService {
  AppUser? get currentUser;

  Stream<AppUser?> get userChanges;

  Future<void> signup(
      String email, String password, String username, File? image);

  Future<void> login(String email, String password);

  Future<void> logout();

  factory AuthService() {
    return AuthMockService();
    //future implementation below
    //return AuthFirebaseService();
  }
}
