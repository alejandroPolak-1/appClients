// login_response.dart

import 'package:equatable/equatable.dart';

class Login extends Equatable {
  final int id;
  final String email;
  final String tokenType;
  final String accessToken;

  const Login({
    required this.id,
    required this.email,
    required this.tokenType,
    required this.accessToken,
  });

  // Método para crear un objeto LoginResponse desde un mapa (JSON)
  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      id: json['id'],
      email: json['email'],
      tokenType: json['token_type'],
      accessToken: json['access_token'],
    );
  }

  // Método para convertir un objeto LoginResponse a un mapa (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'token_type': tokenType,
      'access_token': accessToken,
    };
  }

  @override
  List<Object?> get props => [id, email, tokenType, accessToken];
}
