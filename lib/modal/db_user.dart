class DbUser {
  int id;
  String email;
  String password;

  DbUser({required this.id, required this.email, required this.password});

  factory DbUser.fromJson(Map<String, dynamic> map) =>
      DbUser(id: map['id'], email: map['email'], password: map['password']);

  Map<String, dynamic> toJson() =>
      {"id": id, "email": email, "password": password};
}
