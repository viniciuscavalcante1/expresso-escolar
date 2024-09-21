// models/user.dart

class User {
  String email;
  String password;
  String? name;
  String securityQuestion;
  String securityAnswer;

  User({
    required this.email,
    required this.password,
    this.name,
    required this.securityQuestion,
    required this.securityAnswer,
  });
}
