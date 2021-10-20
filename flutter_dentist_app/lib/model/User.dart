class User {
  final String id;
  final String name;
  final String username;
  final String password;
  final String role;
  final String avatar;
  final String address;
  final bool isActive;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.password,
    required this.role,
    required this.avatar,
    required this.address,
    required this.isActive,
  });
  factory User.fromJson(dynamic json) {
    return User(
      id: json['_id'] as String,
      name: json['name'],
      username: json['username'],
      password: json['password'],
      role: json['role'],
      avatar: json['avatar'],
      address: json['address'],
      isActive: json['isActive'],
    );
  }
}
