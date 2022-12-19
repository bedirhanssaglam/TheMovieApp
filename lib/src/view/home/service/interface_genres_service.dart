import 'package:the_movie/src/view/home/model/base_genres_model.dart';
import 'package:the_movie/src/view/home/model/genres_model.dart';
import 'package:vexana/vexana.dart';

abstract class IGenresService {
  final INetworkManager networkManager;

  IGenresService(this.networkManager);

  Future<List<GenresModel>> fetchAllGenres();
}
