import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:project/core/services/auth_service.dart';

import '../models/app_user.dart';

class AuthMockService implements AuthService {
  static const _defaultUser = AppUser(
      id: '0',
      name: 'teste',
      email: 'teste@teste.com',
      imageURL: 'assets/images/avatar.png');

  static Map<String, AppUser> _users = {
    _defaultUser.email: _defaultUser,
  };

  //Stream methods
  static AppUser? _currentUser;

  static final _userChanges = Stream<AppUser?>.multi((controller) {
    _userStreamController = controller;
    _updateUser(null);
  });

  @override
  // TODO: implement userChanges
  Stream<AppUser?> get userChanges => _userChanges;

  static void _updateUser(AppUser? user) {
    _currentUser = user;
    _userStreamController?.add(user);
  }

  static MultiStreamController<AppUser?>? _userStreamController;

  @override
  // TODO: implement currentUser
  get currentUser => _currentUser;

  //User Methods
  @override
  Future<void> login(String email, String password) async {
    _updateUser(_users[email]);
  }

  @override
  Future<void> logout() async {
    _updateUser(null);
  }

  @override
  Future<void> signup(
    String email,
    String password,
    String username,
    File? image,
  ) async {
    final newUser = AppUser(
        id: Random().nextDouble().toString(),
        name: username,
        email: email,
        imageURL: image?.path ?? 'assets/images/avatar.png');
    //putIfAbsent will add the user to the map if it is not there
    _users.putIfAbsent(email, () => newUser);
    _updateUser(newUser);
  }
}
