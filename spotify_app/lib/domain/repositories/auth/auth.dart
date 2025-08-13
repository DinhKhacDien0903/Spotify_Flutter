import 'package:dartz/dartz.dart';
import 'package:spotify_app/data/models/create_user_request.dart';
import 'package:spotify_app/data/models/signin_user_request.dart';

abstract class AuthRepository {
  Future<Either> signin(SigninUserRequest request);
  Future<Either> signup(CreateUserRequest request);
}
