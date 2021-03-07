import 'dart:io';

import 'package:desafio_capyba/locator.dart';
import 'package:desafio_capyba/repositories/auth_repo.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageRepo {
  FirebaseStorage _storage = FirebaseStorage.instanceFor(
    bucket: "gs://desafio-capyba.appspot.com",
  );

  AuthRepo _authRepo = locator.get<AuthRepo>();

  Future<String> uploadFile(File file) async {
    var user = await _authRepo.getUser();
    var storageRef = _storage.ref().child("user/profile/${user.uid}");
    var uploadTask = storageRef.putFile(file);
    var completedTask = await uploadTask;
    String downloadUrl = await completedTask.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> getUserProfileImage(String uid) async {
    return await _storage.ref().child("user/profile/$uid").getDownloadURL();
  }
}
