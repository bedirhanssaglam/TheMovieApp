import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie/src/core/init/network/vexana_manager.dart';
import 'package:the_movie/src/view/home/service/genres_service.dart';
import 'package:the_movie/src/view/home/service/interface_genres_service.dart';

void main() {
  late IGenresService genresService;
  setUp(() {
    genresService = GenresService(VexanaManager.instance.networkManager);
  });

  test('fetch all genres test', () async {
    var response = await genresService.fetchAllGenres();
    expect(response, isNotEmpty);
  });
}
