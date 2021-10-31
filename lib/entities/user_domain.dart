class UserDomain{
  int id;
  String name;
  String? username;
  String email;
  String? phone;
  String? website;

  UserDomain({
    required this.id,
    required this.name,
    this.username,
    required this.email,
    this.phone,
    this.website
  });

}