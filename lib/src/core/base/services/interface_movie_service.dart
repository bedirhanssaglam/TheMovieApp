import 'package:the_movie/src/core/base/models/movie_model.dart';
import 'package:the_movie/src/core/base/models/movie_star_model.dart';
import 'package:vexana/vexana.dart';

import '../models/genres_model.dart';

abstract class IMovieService {
  final INetworkManager networkManager;

  IMovieService(this.networkManager);

  Future<List<GenresModel>> fetchAllGenres();
  Future<List<MovieStarModel>> fetchAllMovieStars();
  Future<List<MovieModel>> fetchAllTopRatedMovies();
  Future<List<MovieModel>> fetchNowPlayinMovies();
  Future<List<MovieModel>> fetchDiscoverMovies();
  Future<List<MovieModel>> fetchSearchedMovie(String searchWord);
  Future<MovieModel> fetchMovieDetailsById(int id);
}
