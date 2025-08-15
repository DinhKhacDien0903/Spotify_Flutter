import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/domain/usecases/song/get_news_play_list.dart';
import 'package:spotify_app/presentation/home/bloc/play_list_state.dart';
import 'package:spotify_app/service_locator.dart';

class PlayListCubit extends Cubit<PlayListState> {
  PlayListCubit() : super(PlayListLoading());

  Future<void> getPlayLists() async {
    var returnedPlayList = await sl<GetNewsPlayListUseCase>().call();

    returnedPlayList.fold(
      (l) {
        emit(PlayListFailure());
      },
      (data) {
        emit(PlayListLoaded(songs: data));
      },
    );
  }
}
