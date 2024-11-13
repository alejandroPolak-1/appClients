class LoginBody {
  final String? email;
  final String? password;

  const LoginBody({
    this.email,
    this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }
}
