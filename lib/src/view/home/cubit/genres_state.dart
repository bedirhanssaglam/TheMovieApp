part of 'genres_cubit.dart';

abstract class GenresState extends Equatable {
  const GenresState();

  @override
  List<Object> get props => [];
}

class GenresInitial extends GenresState {}

class GenresLoading extends GenresState {}

class GenresLoaded extends GenresState {
  final List<GenresModel> genres;

  const GenresLoaded(this.genres);

  @override
  List<Object> get props => [genres];
}

class GenresError extends GenresState {
  final String errorMessage;

  const GenresError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
