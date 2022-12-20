import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:the_movie/src/core/base/models/movie_model.dart';

import '../models/genres_model.dart';
import '../models/movie_star_model.dart';
import '../services/interface_movie_service.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final IMovieService movieService;
  MovieCubit(this.movieService) : super(MovieInitial());

  Future<void> fetchAllGenres() async {
    emit(GenresLoading());
    try {
      final List<GenresModel> movies = await movieService.fetchAllGenres();
      emit(GenresLoaded(movies));
    } catch (e) {
      emit(GenresError(e.toString()));
    }
  }

  Future<void> fetchAllMoviStars() async {
    emit(MovieStarsLoading());
    try {
      final List<MovieStarModel> movieStars =
          await movieService.fetchAllMovieStars();
      emit(MovieStarsLoaded(movieStars));
    } catch (e) {
      emit(MovieStarsError(e.toString()));
    }
  }
}
