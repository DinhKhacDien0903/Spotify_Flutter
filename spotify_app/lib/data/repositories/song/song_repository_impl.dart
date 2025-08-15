import 'package:dartz/dartz.dart';
import 'package:spotify_app/data/sources/song/song_service.dart';
import 'package:spotify_app/domain/repositories/song/song.dart';
import 'package:spotify_app/service_locator.dart';

class SongRepositoryImpl extends SongRepository {
  @override
  Future<Either> getNewSongs() async {
    return await sl<SongFirebaseService>().getNewSongs();
  }

  @override
  Future<Either> getPlayList() async {
    return await sl<SongFirebaseService>().getPlayList();
  }
}
