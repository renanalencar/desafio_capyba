class UserModel {
  String uid;
  String displayName;
  String avatarUrl;
  String email;
  String password;

  UserModel(this.uid, {this.displayName, this.avatarUrl, this.email});
}
