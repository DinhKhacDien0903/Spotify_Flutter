import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify_app/domain/entities/song/song.dart';

class SongModel {
  String? artist;
  String? title;
  Timestamp? releaseDate;
  num? duration;

  SongModel({this.artist, this.title, this.releaseDate, this.duration});

  SongModel.fromJson(Map<String, dynamic> data) {
    title = data['title'];
    artist = data['artist'];
    releaseDate = data['releaseDate'];
    duration = data['duration'];
  }
}

extension SongModelX on SongModel {
  SongEntity toEntity() {
    return SongEntity(
      artist: artist!,
      title: title!,
      releaseDate: releaseDate!,
      duration: duration!,
    );
  }
}
