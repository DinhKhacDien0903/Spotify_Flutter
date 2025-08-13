import 'package:dartz/dartz.dart';
import 'package:spotify_app/core/usecases/usecase.dart';
import 'package:spotify_app/data/models/signin_user_request.dart';
import 'package:spotify_app/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_app/service_locator.dart';

class SigninUsecase implements UseCase<Either, SigninUserRequest> {
  @override
  Future<Either> call({SigninUserRequest? params}) {
    return sl<AuthFirebaseService>().signin(params!);
  }
}
