//user model
class UserModel {
  final List<String> spacesTaken;
  final bool isAdmin;
  final bool admin;
  UserModel({
    this.spacesTaken = const [],
    this.isAdmin = false,
    this.admin = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'spacesTaken': spacesTaken,
      'isAdmin': isAdmin,
      'admin': admin,
    };
  }

  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      spacesTaken:
          (json['spacesTaken'] as List).map((item) => item as String).toList(),
      isAdmin: json['isAdmin'] ?? false,
      admin: json['admin'] ?? false,
    );
  }
}
