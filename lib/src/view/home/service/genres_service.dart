import 'package:the_movie/src/view/home/model/base_genres_model.dart';
import 'package:the_movie/src/view/home/model/genres_model.dart';
import 'package:the_movie/src/view/home/service/interface_genres_service.dart';
import 'package:vexana/vexana.dart';

import '../../../core/constants/app/app_constants.dart';
import '../../../core/constants/enums/network_enums.dart';

class GenresService extends IGenresService {
  GenresService(super.networkManager);

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
}
