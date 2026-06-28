class AuthRequest {
  final String? name;
  final String email;
  final String password;
  final String? phoneNumber;

  AuthRequest({
    this.name,
    this.phoneNumber,
    required this.email,
    required this.password,
  });
}

class AuthResponse {
  final String message;
  final bool statusCode;

  AuthResponse({required this.message, required this.statusCode});
  factory AuthResponse.fromJson(Map<String, dynamic> data) {
    return AuthResponse(
      message: data['message'],
      statusCode: data['statusCode'],
    );
  }
}
