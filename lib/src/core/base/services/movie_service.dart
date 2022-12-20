import 'package:the_movie/src/core/base/models/movie_model.dart';
import 'package:the_movie/src/core/base/models/movie_star_model.dart';
import 'package:the_movie/src/core/base/models/paginated_list_response.dart';
import 'package:the_movie/src/core/base/services/interface_movie_service.dart';
import 'package:vexana/vexana.dart';

import '../../../core/constants/app/app_constants.dart';
import '../../../core/constants/enums/network_enums.dart';
import '../models/base_genres_model.dart';
import '../models/genres_model.dart';

class MovieService extends IMovieService {
  MovieService(super.networkManager);

  @override
  Future<List<GenresModel>> fetchAllGenres() async {
    var response = await networkManager.send(
      NetworkEnums.genres.endpointName,
      parseModel: BaseGenresModel(parseModel: GenresModel()),
      method: RequestType.GET,
      queryParameters: {"api_key": AppConstants.instance.apiKey},
    );
    return response.data.genres;
  }

  @override
  Future<List<MovieStarModel>> fetchAllMovieStars() async {
    var response = await networkManager.send(
      NetworkEnums.movieStars.endpointName,
      parseModel: PaginatedListResponse(
        parseModel: MovieStarModel(),
      ),
      method: RequestType.GET,
      queryParameters: {"api_key": AppConstants.instance.apiKey},
    );
    return response.data.results;
  }

  @override
  Future<List<MovieModel>> fetchAllTopRatedMovies() async {
    var response = await networkManager.send(
      NetworkEnums.topRated.endpointName,
      parseModel: PaginatedListResponse(
        parseModel: MovieModel(),
      ),
      method: RequestType.GET,
      queryParameters: {"api_key": AppConstants.instance.apiKey},
    );
    return response.data.results;
  }

  @override
  Future<List<MovieModel>> fetchNowPlayinMovies() async {
    var response = await networkManager.send(
      NetworkEnums.nowPlaying.endpointName,
      parseModel: PaginatedListResponse(
        parseModel: MovieModel(),
      ),
      method: RequestType.GET,
      queryParameters: {"api_key": AppConstants.instance.apiKey},
    );
    return response.data.results;
  }

  @override
  Future<List<MovieModel>> fetchDiscoverMovies() async {
    var response = await networkManager.send(
      NetworkEnums.discover.endpointName,
      parseModel: PaginatedListResponse(
        parseModel: MovieModel(),
      ),
      method: RequestType.GET,
      queryParameters: {"api_key": AppConstants.instance.apiKey},
    );
    return response.data.results;
  }

  @override
  Future<MovieModel> fetchMovieDetailsById(int id) async {
    var response = await networkManager.send(
      "${NetworkEnums.movieDetails.endpointName}$id",
      parseModel: MovieModel(),
      method: RequestType.GET,
      queryParameters: {"api_key": AppConstants.instance.apiKey},
    );
    return response.data;
  }

  @override
  Future<List<MovieModel>> fetchSearchedMovie(String searchWord) async {
    var response = await networkManager.send(
      NetworkEnums.searchMovie.endpointName,
      parseModel: PaginatedListResponse(
        parseModel: MovieModel(),
      ),
      method: RequestType.GET,
      queryParameters: {
        "api_key": AppConstants.instance.apiKey,
        "query": searchWord,
      },
    );
    return response.data.results;
  }
}
