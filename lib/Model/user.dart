class MyUser {
  String? id;
  String? name;
  String email;
  String password;
  MyUser(this.email, this.password, {id});

  static Map<String, dynamic> toMap(MyUser user) {
    return {
      "name": user.name != null ? user.name! : "",
      "email": user.email,
      "password": user.password
    };
  }

  MyUser.fromJson(Map<String, dynamic> map)
      : id = map['_id'],
        email = map['email'],
        password = map['password'];
}
