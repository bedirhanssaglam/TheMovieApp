part of 'movie_cubit.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {}

class GenresLoading extends MovieState {}

class GenresLoaded extends MovieState {
  final List<GenresModel> genres;

  const GenresLoaded(this.genres);

  @override
  List<Object> get props => [genres];
}

class GenresError extends MovieState {
  final String errorMessage;

  const GenresError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class MovieStarsLoading extends MovieState {}

class MovieStarsLoaded extends MovieState {
  final List<MovieStarModel> movieStars;

  const MovieStarsLoaded(this.movieStars);

  @override
  List<Object> get props => [movieStars];
}

class MovieStarsError extends MovieState {
  final String errorMessage;

  const MovieStarsError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class TopRatedMoviesLoading extends MovieState {}

class TopRatedMoviesLoaded extends MovieState {
  final List<MovieModel> movies;

  const TopRatedMoviesLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class TopRatedMoviesError extends MovieState {
  final String errorMessage;

  const TopRatedMoviesError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class NowPlayingMoviesLoading extends MovieState {}

class NowPlayingMoviesLoaded extends MovieState {
  final List<MovieModel> movies;

  const NowPlayingMoviesLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class NowPlayingMoviesError extends MovieState {
  final String errorMessage;

  const NowPlayingMoviesError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class FetchDiscoverMoviesLoading extends MovieState {}

class FetchDiscoverMoviesLoaded extends MovieState {
  final List<MovieModel> movies;

  const FetchDiscoverMoviesLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class FetchDiscoverMoviesError extends MovieState {
  final String errorMessage;

  const FetchDiscoverMoviesError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class FetchMovieDetailsLoading extends MovieState {}

class FetchMovieDetailsLoaded extends MovieState {
  final MovieModel movie;

  const FetchMovieDetailsLoaded(this.movie);

  @override
  List<Object> get props => [movie];
}

class FetchMovieDetailsError extends MovieState {
  final String errorMessage;

  const FetchMovieDetailsError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
