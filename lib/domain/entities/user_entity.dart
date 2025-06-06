class UserEntity {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;

  const UserEntity({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          username == other.username &&
          email == other.email &&
          phone == other.phone &&
          website == other.website;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      username.hashCode ^
      email.hashCode ^
      phone.hashCode ^
      website.hashCode;
} 