import 'package:dartz/dartz.dart';
import 'package:spotify_app/data/models/create_user_request.dart';
import 'package:spotify_app/data/models/signin_user_request.dart';
import 'package:spotify_app/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_app/domain/repositories/auth/auth.dart';
import 'package:spotify_app/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signin(SigninUserRequest request) async {
    return await sl<AuthFirebaseService>().signin(request);
  }

  @override
  Future<Either> signup(CreateUserRequest request) async {
    return await sl<AuthFirebaseService>().signup(request);
  }
}
