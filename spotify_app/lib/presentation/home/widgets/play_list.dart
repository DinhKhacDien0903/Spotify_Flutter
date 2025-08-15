import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/domain/entities/song/song.dart';
import 'package:spotify_app/presentation/home/bloc/play_list_cubit.dart';
import 'package:spotify_app/presentation/home/bloc/play_list_state.dart';

class PlayList extends StatelessWidget {
  const PlayList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlayListCubit()..getPlayLists(),
      child: BlocBuilder<PlayListCubit, PlayListState>(
        builder: (context, state) {
          if (state is PlayListLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PlayListFailure) {
            return Center(child: Text('Failed to load playlists'));
          } else if (state is PlayListLoaded) {
            final songs = state.songs;
            return ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(songs[index].title),
                  subtitle: Text(songs[index].artist),
                );
              },
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }

  // Widget _playList(List<SongEntity> songs){

  // }
}
