import 'package:dartz/dartz.dart';
import 'package:spotify_app/data/models/create_user_request.dart';

abstract class AuthRepository {
  Future<void> signin();
  Future<Either> signup(CreateUserRequest request);
}
