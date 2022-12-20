import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:the_movie/src/core/base/cubit/movie_cubit.dart';
import 'package:the_movie/src/core/base/functions/base_functions.dart';
import 'package:the_movie/src/core/base/services/movie_service.dart';
import 'package:the_movie/src/core/extensions/num_extensions.dart';
import 'package:the_movie/src/core/init/network/vexana_manager.dart';

import '../../core/base/models/genres_model.dart';
import '../../core/constants/app/app_constants.dart';
import 'widgets/banner_title.dart';
import 'widgets/circular_categories.dart';
import 'widgets/movie_star_card.dart';
import 'widgets/slider_movies.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late MovieCubit movieCubit;

  @override
  void initState() {
    super.initState();
    movieCubit =
        MovieCubit(MovieService(VexanaManager.instance.networkManager));
    movieCubit.fetchAllGenres();
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
              4.h.ph,
              BlocBuilder<MovieCubit, MovieState>(
                bloc: movieCubit,
                builder: (context, state) {
                  if (state is GenresLoading) {
                    return platformIndicator();
                  } else if (state is GenresLoaded) {
                    final List<GenresModel> genres = state.genres;
                    return _buildGenresList(genres);
                  } else if (state is GenresError) {
                    return errorText(state.errorMessage);
                  } else {
                    return errorText("Something went wrong!");
                  }
                },
              ),
              3.h.ph,
              const SliderMovies(),
              5.h.ph,
              BannerTitle(
                firstText: "Trend ",
                secondText: "Movie Stars",
                firstTextColor: AppConstants.instance.dodgerBlue,
                secondTextColor: AppConstants.instance.malibu,
              ),
              4.h.ph,
              const MovieStarCard(),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _buildGenresList(List<GenresModel> genres) {
    return SizedBox(
      height: 16.h,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        padding: EdgeInsets.only(right: 2.w),
        itemBuilder: (context, index) {
          return CircularCategories(
            image:
                "${AppConstants.instance.baserUrlForImage}/tmU7GeKVybMWFButWEGl2M4GeiP.jpg",
            text: "${genres[index].name}",
          );
        },
      ),
    );
  }
}
