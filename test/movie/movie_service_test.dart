import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie/src/core/base/services/interface_movie_service.dart';
import 'package:the_movie/src/core/base/services/movie_service.dart';
import 'package:the_movie/src/core/init/network/vexana_manager.dart';

void main() {
  late IMovieService movieService;
  setUp(() {
    movieService = MovieService(VexanaManager.instance.networkManager);
  });

  test('fetch all genres test', () async {
    var response = await movieService.fetchAllGenres();
    expect(response, isNotEmpty);
  });

  test('fetch all movie stars test', () async {
    var response = await movieService.fetchAllMovieStars();
    expect(response, isNotEmpty);
  });

  test('fetch all top rated movies test', () async {
    var response = await movieService.fetchAllTopRatedMovies();
    expect(response, isNotEmpty);
  });

  test('fetch all top rated movies test', () async {
    var response = await movieService.fetchNowPlayinMovies();
    expect(response, isNotEmpty);
  });

  test('fetch discover movies test', () async {
    var response = await movieService.fetchDiscoverMovies();
    expect(response, isNotEmpty);
  });

  test('fetch movie details test', () async {
    var response = await movieService.fetchMovieDetailsById(238);
    expect(response, isNotNull);
  });
}
