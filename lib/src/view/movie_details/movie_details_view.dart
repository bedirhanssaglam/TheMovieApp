import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie/src/core/base/cubit/movie_cubit.dart';
import 'package:the_movie/src/core/base/models/movie_model.dart';
import 'package:the_movie/src/core/base/services/movie_service.dart';
import 'package:the_movie/src/core/components/appbar/custom_app_bar.dart';

import '../../core/base/singleton/base_singleton.dart';
import 'widgets/detail_description_widget.dart';
import 'widgets/detail_header_widget.dart';

class MovieDetailsView extends StatefulWidget {
  const MovieDetailsView({
    super.key,
    required this.id,
  });

  final int id;

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView>
    with BaseSingleton {
  late MovieCubit movieCubit;

  @override
  void initState() {
    super.initState();
    movieCubit = MovieCubit(MovieService(vexana.networkManager));
    movieCubit.fetchMovieDetailsById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isDetailOrSearchView: true,
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<MovieCubit, MovieState>(
          bloc: movieCubit,
          builder: (context, state) {
            if (state is FetchMovieDetailsLoading) {
              return functions.platformIndicator();
            } else if (state is FetchMovieDetailsLoaded) {
              final MovieModel movie = state.movie;
              return Column(
                children: [
                  DetailHeaderWidget(movie: movie),
                  DetailDescriptionWidget(movie: movie),
                ],
              );
            } else if (state is FetchMovieDetailsError) {
              return functions.errorText(state.errorMessage);
            } else {
              return functions.errorText("Something went wrong!");
            }
          },
        ),
      ),
    );
  }
}
