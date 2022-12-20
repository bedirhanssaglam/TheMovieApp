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

  Future<void> fetchAllTopRatedMovies() async {
    emit(TopRatedMoviesLoading());
    try {
      final List<MovieModel> movies =
          await movieService.fetchAllTopRatedMovies();
      emit(TopRatedMoviesLoaded(movies));
    } catch (e) {
      emit(TopRatedMoviesError(e.toString()));
    }
  }

  Future<void> fetchNowPlayingMovies() async {
    emit(NowPlayingMoviesLoading());
    try {
      final List<MovieModel> movies = await movieService.fetchNowPlayinMovies();
      emit(NowPlayingMoviesLoaded(movies));
    } catch (e) {
      emit(NowPlayingMoviesError(e.toString()));
    }
  }

  Future<void> fetchDiscoverMovies() async {
    emit(FetchDiscoverMoviesLoading());
    try {
      final List<MovieModel> movies = await movieService.fetchDiscoverMovies();
      emit(FetchDiscoverMoviesLoaded(movies));
    } catch (e) {
      emit(FetchDiscoverMoviesError(e.toString()));
    }
  }

  Future<void> fetchMovieDetailsById(int id) async {
    emit(FetchMovieDetailsLoading());
    try {
      final MovieModel movie = await movieService.fetchMovieDetailsById(id);
      emit(FetchMovieDetailsLoaded(movie));
    } catch (e) {
      emit(FetchMovieDetailsError(e.toString()));
    }
  }

  Future<void> fetchSearchedMovie(String searchWord) async {
    emit(FetchSearchedMovieLoading());
    try {
      final List<MovieModel> movies =
          await movieService.fetchSearchedMovie(searchWord);
      emit(FetchSearchedMovieLoaded(movies));
    } catch (e) {
      emit(FetchSearchedMovieError(e.toString()));
    }
  }
}
