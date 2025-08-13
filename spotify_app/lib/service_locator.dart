import 'package:get_it/get_it.dart';
import 'package:spotify_app/core/usecases/usecase.dart';
import 'package:spotify_app/data/repositories/auth/auth_repository_impl.dart';
import 'package:spotify_app/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_app/domain/repositories/auth/auth.dart';
import 'package:spotify_app/domain/usecases/auth/signin.dart';
import 'package:spotify_app/domain/usecases/auth/signup.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());
  sl.registerSingleton<SigninUsecase>(SigninUsecase());
}
