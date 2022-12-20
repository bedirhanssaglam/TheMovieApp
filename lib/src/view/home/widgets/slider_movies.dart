import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:the_movie/src/core/base/functions/base_functions.dart';
import 'package:the_movie/src/core/base/models/movie_model.dart';
import 'package:the_movie/src/core/base/services/movie_service.dart';
import 'package:the_movie/src/core/init/network/vexana_manager.dart';
import 'package:the_movie/src/view/home/widgets/slider_movie_card.dart';

import '../../../core/base/cubit/movie_cubit.dart';
import '../../../core/constants/app/app_constants.dart';

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

class _SliderMoviesState extends State<SliderMovies> {
  late MovieCubit movieCubit;

  @override
  void initState() {
    super.initState();
    movieCubit =
        MovieCubit(MovieService(VexanaManager.instance.networkManager));
    movieCubit.fetchAllTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
      bloc: movieCubit,
      builder: (context, state) {
        if (state is TopRatedMoviesLoading) {
          return platformIndicator();
        } else if (state is TopRatedMoviesLoaded) {
          List<MovieModel> movies = state.movies;
          return _buildTopRatedSlider(movies);
        } else if (state is TopRatedMoviesError) {
          return errorText(state.errorMessage);
        } else {
          return errorText("Something went wrong!");
        }
      },
    );
  }

  SliderMovieCard _buildTopRatedSlider(List<MovieModel> movies) {
    return SliderMovieCard(
      children: List.generate(
        5,
        (index) => Container(
          height: 20.h,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "${AppConstants.instance.baserUrlForImage}${movies[index].backdropPath}",
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}
