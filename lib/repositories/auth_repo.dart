import 'package:firebase_auth/firebase_auth.dart';
import 'package:desafio_capyba/models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepo {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthRepo();

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final User user = (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    return user;
  }

  Future<UserModel> createUserWithEmailAndPassword(
      {String email, String password}) async {
    var authResult = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return UserModel(authResult.user.uid,
        displayName: authResult.user.displayName);
  }

  Future<UserModel> signInWithEmailAndPassword(
      {String email, String password}) async {
    var authResult = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return UserModel(authResult.user.uid,
        displayName: authResult.user.displayName);
  }

  Future<UserModel> getUser() async {
    var user = _auth.currentUser;
    return UserModel(user.uid,
        displayName: user.displayName, email: user.email);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> updateDisplayName(String displayName) async {
    var user = _auth.currentUser;

    user.updateProfile(
      displayName: displayName,
    );
  }

  Future<bool> validatePassword(String password) async {
    var user = _auth.currentUser;

    var authCredentials =
        EmailAuthProvider.credential(email: user.email, password: password);
    try {
      var authResult = await user.reauthenticateWithCredential(authCredentials);
      return authResult.user != null;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> updatePassword(String password) async {
    var user = _auth.currentUser;
    user.updatePassword(password);
  }
}
