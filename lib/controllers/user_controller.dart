import 'dart:io';

import 'package:desafio_capyba/locator.dart';
import 'package:desafio_capyba/models/user_model.dart';
import 'package:desafio_capyba/repositories/auth_repo.dart';
import 'package:desafio_capyba/repositories/storage_repo.dart';

class UserController {
  UserModel _currentUser;
  AuthRepo _authRepo = locator.get<AuthRepo>();
  StorageRepo _storageRepo = locator.get<StorageRepo>();
  Future init;

  UserController() {
    init = initUser();
  }

  Future<UserModel> initUser() async {
    _currentUser = await _authRepo.getUser();
    return _currentUser;
  }

  UserModel get currentUser => _currentUser;

  Future<void> uploadProfilePicture(File image) async {
    _currentUser.avatarUrl = await locator.get<StorageRepo>().uploadFile(image);
  }

  Future<String> getDownloadUrl() async {
    return await _storageRepo.getUserProfileImage(currentUser.uid);
  }

  Future<void> signInWithEmailAndPassword(
      {String email, String password}) async {
    _currentUser = await _authRepo.signInWithEmailAndPassword(
        email: email, password: password);

    _currentUser.avatarUrl = await getDownloadUrl();
  }

  Future<void> createUserWithEmailAndPassword(
      {String email, String password}) async {
    _currentUser = await _authRepo.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  void updateDisplayName(String displayName) {
    _currentUser.displayName = displayName;
    _authRepo.updateDisplayName(displayName);
  }

  Future<void> signOut() async {
    await _authRepo.signOut();
    _currentUser = null;
  }
}
