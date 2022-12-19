import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:the_movie/src/core/base/functions/base_functions.dart';
import 'package:the_movie/src/core/extensions/num_extensions.dart';
import 'package:the_movie/src/core/init/network/vexana_manager.dart';
import 'package:the_movie/src/view/home/service/genres_service.dart';

import '../../core/components/movie_card/movie_card.dart';
import '../../core/constants/app/app_constants.dart';
import 'cubit/genres_cubit.dart';
import 'model/genres_model.dart';
import 'widgets/banner_title.dart';
import 'widgets/circular_categories.dart';
import 'widgets/slider_movies.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late GenresCubit genresCubit;

  @override
  void initState() {
    super.initState();
    genresCubit =
        GenresCubit(GenresService(VexanaManager.instance.networkManager));
    genresCubit.fetchAllGenres();
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
              BlocBuilder<GenresCubit, GenresState>(
                bloc: genresCubit,
                builder: (context, state) {
                  if (state is GenresLoading) {
                    return platformIndicator();
                  } else if (state is GenresLoaded) {
                    final List<GenresModel> genres = state.genres;
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
                                "${AppConstants.instance.baserUrlForImage}tmU7GeKVybMWFButWEGl2M4GeiP.jpg",
                            text: "${genres[index].name}",
                          );
                        },
                      ),
                    );
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
                firstText: "Recommended ",
                secondText: "Movies",
                firstTextColor: AppConstants.instance.dodgerBlue,
                secondTextColor: AppConstants.instance.malibu,
              ),
              4.h.ph,
              _recommendedMoviesList(),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _recommendedMoviesList() {
    return SizedBox(
      height: 20.h,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 3.w),
            child: const MovieCard(),
          );
        },
      ),
    );
  }

  SizedBox _circularCategoriesList() {
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
                "${AppConstants.instance.baserUrlForImage}tmU7GeKVybMWFButWEGl2M4GeiP.jpg",
            text: "Action",
          );
        },
      ),
    );
  }
}
