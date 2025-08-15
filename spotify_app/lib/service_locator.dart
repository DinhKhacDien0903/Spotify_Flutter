import 'package:get_it/get_it.dart';
import 'package:spotify_app/core/usecases/usecase.dart';
import 'package:spotify_app/data/repositories/auth/auth_repository_impl.dart';
import 'package:spotify_app/data/repositories/song/song_repository_impl.dart';
import 'package:spotify_app/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_app/data/sources/song/song_service.dart';
import 'package:spotify_app/domain/repositories/auth/auth.dart';
import 'package:spotify_app/domain/repositories/song/song.dart';
import 'package:spotify_app/domain/usecases/auth/signin.dart';
import 'package:spotify_app/domain/usecases/auth/signup.dart';
import 'package:spotify_app/domain/usecases/song/get_news_play_list.dart';
import 'package:spotify_app/domain/usecases/song/get_news_songs.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<SongFirebaseService>(SongFirebaseServiceImpl());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<SongRepository>(SongRepositoryImpl());
  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());
  sl.registerSingleton<SigninUsecase>(SigninUsecase());
  sl.registerSingleton<GetNewsSongsUseCase>(GetNewsSongsUseCase());
  sl.registerSingleton<GetNewsPlayListUseCase>(GetNewsPlayListUseCase());
}
