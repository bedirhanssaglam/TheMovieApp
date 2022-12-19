import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:the_movie/src/view/home/model/genres_model.dart';
import 'package:the_movie/src/view/home/service/interface_genres_service.dart';

part 'genres_state.dart';

class GenresCubit extends Cubit<GenresState> {
  final IGenresService genresService;

  GenresCubit(this.genresService) : super(GenresInitial());

  Future<void> fetchAllGenres() async {
    emit(GenresLoading());
    try {
      final List<GenresModel> genres = await genresService.fetchAllGenres();
      emit(GenresLoaded(genres));
    } catch (e) {
      emit(GenresError(e.toString()));
    }
  }
}
