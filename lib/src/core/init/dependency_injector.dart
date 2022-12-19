import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie/src/view/home/cubit/genres_cubit.dart';
import 'package:the_movie/src/view/home/service/genres_service.dart';
import 'package:the_movie/src/view/home/service/interface_genres_service.dart';
import 'package:vexana/vexana.dart';

import 'network/vexana_manager.dart';

class DependencyInjector {
  static DependencyInjector? _instance;

  static DependencyInjector get instance {
    _instance ??= DependencyInjector._init();
    return _instance!;
  }

  late final INetworkManager networkManager;
  late final IGenresService genresService;
  late final GenresCubit genresCubit;

  DependencyInjector._init() {
    networkManager = VexanaManager.instance.networkManager;
    genresService = GenresService(networkManager);
    genresCubit = GenresCubit(genresService);
  }

  List<RepositoryProvider> get repositoryProviders => [
        RepositoryProvider<IGenresService>(create: (context) => genresService),
      ];

  List<BlocProvider<Cubit>> get globalBlocProviders => [
        BlocProvider<GenresCubit>(create: (context) => genresCubit),
      ];
}
