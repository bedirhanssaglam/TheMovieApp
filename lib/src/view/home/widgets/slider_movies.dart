import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:the_movie/src/core/base/models/movie_model.dart';
import 'package:the_movie/src/core/base/services/movie_service.dart';
import 'package:the_movie/src/view/home/widgets/slider_movie_card.dart';

import '../../../core/base/cubit/movie_cubit.dart';
import '../../../core/base/singleton/base_singleton.dart';

class SliderMovies extends StatefulWidget {
  final double width;
  final double height;
  final double radius;

  const SliderMovies({
    Key? key,
    this.width = 0.9,
    this.height = 0.2,
    this.radius = 0,
  }) : super(key: key);

  @override
  State<SliderMovies> createState() => _SliderMoviesState();
}

class _SliderMoviesState extends State<SliderMovies> with BaseSingleton {
  late MovieCubit movieCubit;

  @override
  void initState() {
    super.initState();
    movieCubit = MovieCubit(MovieService(vexana.networkManager));
    movieCubit.fetchAllTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
      bloc: movieCubit,
      builder: (context, state) {
        if (state is TopRatedMoviesLoading) {
          return functions.platformIndicator();
        } else if (state is TopRatedMoviesLoaded) {
          List<MovieModel> movies = state.movies;
          return _buildTopRatedSlider(movies);
        } else if (state is TopRatedMoviesError) {
          return functions.errorText(state.errorMessage);
        } else {
          return functions.errorText("Something went wrong!");
        }
      },
    );
  }

  SliderMovieCard _buildTopRatedSlider(List<MovieModel> movies) {
    return SliderMovieCard(
      children: List.generate(
        5,
        (index) => InkWell(
          onTap: () {
            context.go('/movie-details/${movies[index].id}');
          },
          child: Container(
            height: 20.h,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "${constants.baserUrlForImage}${movies[index].backdropPath}",
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ),
    );
  }
}
