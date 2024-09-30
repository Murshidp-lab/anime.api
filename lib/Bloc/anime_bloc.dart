import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled9/repository/api/anime/anime.dart';

import '../repository/model class/anime model.dart';

part 'anime_event.dart';
part 'anime_state.dart';

class AnimeBloc extends Bloc<AnimeEvent, AnimeState> {
  late Animemodel animemodel;
  AnimeApi animeapi=AnimeApi();
  AnimeBloc() : super(AnimeInitial()) {
    on<AnimeEvent>((event, emit)async {
      emit (Animeloading());
      try{
        animemodel=await animeapi.getAnime();
        emit(Animeloaded());

      }
      catch (e){
        emit(Animeerror());
      }
      // TODO: implement event handler
    });
  }
}
