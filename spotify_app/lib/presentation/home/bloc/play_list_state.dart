import 'package:spotify_app/domain/entities/song/song.dart';

abstract class PlayListState {}

class PlayListLoading extends PlayListState {}

class PlayListLoaded extends PlayListState {
  final List<SongEntity> songs;

  PlayListLoaded(this.songs);
}

class PlayListFailure extends PlayListState {}
