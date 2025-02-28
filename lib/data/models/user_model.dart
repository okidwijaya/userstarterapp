class UserModel {
  final int id;
  final String? name;
  final String email;
  final String? token; // Nullable to prevent crash

  UserModel({
    required this.id,
    this.name,
    required this.email,
    this.token, 
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      token: json['token'], 
    );
  }
}

class UserRegistrationModel {
  final int id;
  final String? name;
  final String email;
  final String? token; // Nullable to prevent crash

  UserRegistrationModel({
    required this.id,
    this.name,
    required this.email,
    this.token, 
  });

  factory UserRegistrationModel.fromJson(Map<String, dynamic> json) {
    return UserRegistrationModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      token: json['token'], 
    );
  }
}
