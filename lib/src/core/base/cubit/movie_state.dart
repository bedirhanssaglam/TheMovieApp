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
