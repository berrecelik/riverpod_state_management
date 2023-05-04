class User {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  User({this.id, this.email, this.firstName, this.lastName, this.avatar});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> user = new Map<String, dynamic>();
    user['id'] = this.id;
    user['email'] = this.email;
    user['first_name'] = this.firstName;
    user['last_name'] = this.lastName;
    user['avatar'] = this.avatar;
    return user;
  }
}
