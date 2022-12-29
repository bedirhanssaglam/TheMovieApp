import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';
import 'package:the_movie/src/core/base/models/movie_model.dart';
import 'package:the_movie/src/core/base/services/movie_service.dart';
import 'package:the_movie/src/core/components/text/custom_text.dart';
import 'package:the_movie/src/core/extensions/num_extensions.dart';

import '../../core/base/cubit/movie_cubit.dart';
import '../../core/base/singleton/base_singleton.dart';
import '../../core/components/movie_list_tile/movie_list_tile.dart';

class NowPlayingMoviesView extends StatefulWidget {
  const NowPlayingMoviesView({super.key});

  @override
  State<NowPlayingMoviesView> createState() => _NowPlayingMoviesViewState();
}

class _NowPlayingMoviesViewState extends State<NowPlayingMoviesView>
    with BaseSingleton {
  late MovieCubit movieCubit;

  @override
  void initState() {
    super.initState();
    movieCubit = MovieCubit(MovieService(vexana.networkManager));
    movieCubit.fetchNowPlayingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              3.h.ph,
              CustomText(
                "Now Playing Movies",
                textStyle: context.textTheme.headline2,
              ),
              3.h.ph,
              BlocBuilder<MovieCubit, MovieState>(
                bloc: movieCubit,
                builder: (context, state) {
                  if (state is NowPlayingMoviesLoading) {
                    return functions.platformIndicator();
                  } else if (state is NowPlayingMoviesLoaded) {
                    final List<MovieModel> movies = state.movies;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return MovieListTile(
                          movies: movies,
                          index: index,
                        );
                      },
                    );
                  } else if (state is NowPlayingMoviesError) {
                    return functions.errorText(state.errorMessage);
                  } else {
                    return functions.errorText("Something went wrong!");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
