import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie/src/core/base/cubit/movie_cubit.dart';
import 'package:the_movie/src/core/base/services/interface_movie_service.dart';
import 'package:vexana/vexana.dart';

import '../base/services/movie_service.dart';
import 'network/vexana_manager.dart';

class DependencyInjector {
  static DependencyInjector? _instance;

  static DependencyInjector get instance {
    _instance ??= DependencyInjector._init();
    return _instance!;
  }

  late final INetworkManager networkManager;
  late final IMovieService genresService;
  late final MovieCubit movieCubit;

  DependencyInjector._init() {
    networkManager = VexanaManager.instance.networkManager;
    genresService = MovieService(networkManager);
    movieCubit = MovieCubit(genresService);
  }

  List<RepositoryProvider> get repositoryProviders => [
        RepositoryProvider<IMovieService>(create: (context) => genresService),
      ];

  List<BlocProvider<Cubit>> get globalBlocProviders => [
        BlocProvider<MovieCubit>(create: (context) => movieCubit),
      ];
}
