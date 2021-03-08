class UserModel {
  String uid;
  String displayName;
  String email;
  String password;
  String avatarUrl;
  bool emailVerified;

  UserModel(this.uid,
      {this.displayName,
      this.email,
      this.password,
      this.avatarUrl,
      this.emailVerified});
}
