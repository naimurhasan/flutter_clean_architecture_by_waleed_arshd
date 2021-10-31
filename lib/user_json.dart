import 'package:waleed_clean_arch_1/entities/user_domain.dart';

class UserJson {
  int id;
  String name;
  String? username;
  String email;
  String? phone;
  String? website;

  UserJson(
      {required this.id,
        required this.name,
        this.username,
        required this.email,
        this.phone,
        this.website});

  factory UserJson.fromJson(Map<String, dynamic> json){
    return UserJson(id: json['id'], name: json['name'], username: json['username'], email: json['email'], phone: json['phone'], website: json['website']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['website'] = this.website;
    return data;
  }

  UserDomain toDomain() => UserDomain(id: this.id, name: this.name, email: this.email);

}