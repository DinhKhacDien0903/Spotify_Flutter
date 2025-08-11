class CreateUserRequest {
  final String email;
  final String password;
  final String fullName;

  CreateUserRequest({
    required this.email,
    required this.password,
    required this.fullName,
  });
}
