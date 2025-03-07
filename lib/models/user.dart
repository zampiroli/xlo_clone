enum UserType { PARTICULAR, PROFESSIONAL }

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.password,
    this.type = UserType.PARTICULAR,
    this.createdAt,
  });
  String id;
  String name;
  String email;
  String phone;
  String password;
  UserType type;
  DateTime createdAt;

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, phone: $phone, type: $type, createdAt: $createdAt';
  }
}
