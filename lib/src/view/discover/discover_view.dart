import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:kartal/kartal.dart';
import 'package:the_movie/src/core/base/services/movie_service.dart';
import 'package:the_movie/src/core/components/movie_list_tile/movie_list_tile.dart';

import 'package:the_movie/src/core/extensions/num_extensions.dart';

import '../../core/base/cubit/movie_cubit.dart';
import '../../core/base/models/movie_model.dart';
import '../../core/base/singleton/base_singleton.dart';
import '../../core/components/text/custom_text.dart';

class DiscoverView extends StatefulWidget {
  const DiscoverView({super.key});

  @override
  State<DiscoverView> createState() => _DiscoverViewState();
}

class _DiscoverViewState extends State<DiscoverView> with BaseSingleton {
  late MovieCubit movieCubit;

  @override
  void initState() {
    super.initState();
    movieCubit = MovieCubit(MovieService(vexana.networkManager));
    movieCubit.fetchDiscoverMovies();
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
                "Discover Movies",
                textStyle: context.textTheme.headline2,
              ),
              3.h.ph,
              BlocBuilder<MovieCubit, MovieState>(
                bloc: movieCubit,
                builder: (context, state) {
                  if (state is FetchDiscoverMoviesLoading) {
                    return functions.platformIndicator();
                  } else if (state is FetchDiscoverMoviesLoaded) {
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
                  } else if (state is FetchDiscoverMoviesError) {
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
