import 'package:dartz/dartz.dart';
import 'package:spotify_app/core/usecases/usecase.dart';
import 'package:spotify_app/data/models/create_user_request.dart';
import 'package:spotify_app/domain/repositories/auth/auth.dart';
import 'package:spotify_app/service_locator.dart';

class SignUpUseCase implements UseCase<Either, CreateUserRequest> {
  @override
  Future<Either> call({CreateUserRequest? params}) {
    return sl<AuthRepository>().signup(params!);
  }
}
