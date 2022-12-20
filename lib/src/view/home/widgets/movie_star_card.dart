import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';
import 'package:the_movie/src/core/base/functions/base_functions.dart';
import 'package:the_movie/src/core/base/services/movie_service.dart';
import 'package:the_movie/src/core/extensions/num_extensions.dart';
import 'package:the_movie/src/core/init/network/vexana_manager.dart';

import '../../../core/base/cubit/movie_cubit.dart';
import '../../../core/base/models/movie_star_model.dart';
import '../../../core/components/text/custom_text.dart';
import '../../../core/constants/app/app_constants.dart';

class MovieStarCard extends StatefulWidget {
  const MovieStarCard({
    Key? key,
  }) : super(key: key);

  @override
  State<MovieStarCard> createState() => _MovieStarCardState();
}

class _MovieStarCardState extends State<MovieStarCard> {
  late MovieCubit movieCubit;

  @override
  void initState() {
    super.initState();
    movieCubit =
        MovieCubit(MovieService(VexanaManager.instance.networkManager));
    movieCubit.fetchAllMoviStars();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
      bloc: movieCubit,
      builder: (context, state) {
        if (state is MovieStarsLoading) {
          return platformIndicator();
        } else if (state is MovieStarsLoaded) {
          List<MovieStarModel> movieStars = state.movieStars;
          return _buildMovieStarsList(movieStars);
        } else if (state is MovieStarsError) {
          return errorText(state.errorMessage);
        } else {
          return errorText("Something went wrong!");
        }
      },
    );
  }

  SizedBox _buildMovieStarsList(List<MovieStarModel> movieStars) {
    return SizedBox(
      height: 20.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 4.w),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 8.h,
                  backgroundImage: NetworkImage(
                    "${AppConstants.instance.baserUrlForImage}${movieStars[index].profilePath}",
                  ),
                ),
                1.h.ph,
                CustomText(
                  "${movieStars[index].name}",
                  textStyle: context.textTheme.headline1,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
