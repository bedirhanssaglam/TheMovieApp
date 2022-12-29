import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:kartal/kartal.dart';
import 'package:the_movie/src/core/base/cubit/movie_cubit.dart';
import 'package:the_movie/src/core/base/models/movie_model.dart';
import 'package:the_movie/src/core/base/services/movie_service.dart';

import 'package:the_movie/src/core/components/text/custom_text.dart';
import 'package:the_movie/src/core/extensions/num_extensions.dart';
import '../../core/base/singleton/base_singleton.dart';
import 'widgets/top_rated_movie_list.dart';

class TopRatedView extends StatefulWidget {
  const TopRatedView({super.key});

  @override
  State<TopRatedView> createState() => _TopRatedViewState();
}

class _TopRatedViewState extends State<TopRatedView> with BaseSingleton {
  late MovieCubit movieCubit;

  @override
  void initState() {
    super.initState();
    movieCubit = MovieCubit(MovieService(vexana.networkManager));
    movieCubit.fetchAllTopRatedMovies();
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
                "Top Rated Movies",
                textStyle: context.textTheme.headline2,
              ),
              3.h.ph,
              BlocBuilder<MovieCubit, MovieState>(
                bloc: movieCubit,
                builder: (context, state) {
                  if (state is TopRatedMoviesLoading) {
                    return functions.platformIndicator();
                  } else if (state is TopRatedMoviesLoaded) {
                    final List<MovieModel> movies = state.movies;
                    return TopRatedMovieList(movies: movies);
                  } else if (state is TopRatedMoviesError) {
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
