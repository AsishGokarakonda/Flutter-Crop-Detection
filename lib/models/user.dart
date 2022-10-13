class User{

  final int id;
  final String username;
  final String name;
  final String email;

  User({
    required this.id,
    required this.username,
    required this.name,
    required this.email,
  });

  static User? fromJson(data) {
    return User(
      id: data['id'],
      username: data['username'],
      name: data['name'],
      email: data['email'],
    );
  }
}