import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';
import 'package:the_movie/src/core/base/services/movie_service.dart';
import 'package:the_movie/src/core/extensions/num_extensions.dart';

import '../../../core/base/cubit/movie_cubit.dart';
import '../../../core/base/models/movie_star_model.dart';
import '../../../core/base/singleton/base_singleton.dart';
import '../../../core/components/text/custom_text.dart';

class MovieStarCard extends StatefulWidget {
  const MovieStarCard({
    Key? key,
  }) : super(key: key);

  @override
  State<MovieStarCard> createState() => _MovieStarCardState();
}

class _MovieStarCardState extends State<MovieStarCard> with BaseSingleton {
  late MovieCubit movieCubit;

  @override
  void initState() {
    super.initState();
    movieCubit = MovieCubit(MovieService(vexana.networkManager));
    movieCubit.fetchAllMoviStars();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
      bloc: movieCubit,
      builder: (context, state) {
        if (state is MovieStarsLoading) {
          return functions.platformIndicator();
        } else if (state is MovieStarsLoaded) {
          List<MovieStarModel> movieStars = state.movieStars;
          return _buildMovieStarsList(movieStars);
        } else if (state is MovieStarsError) {
          return functions.errorText(state.errorMessage);
        } else {
          return functions.errorText("Something went wrong!");
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
                  backgroundColor: constants.outerSpace,
                  backgroundImage: NetworkImage(
                    "${constants.baserUrlForImage}${movieStars[index].profilePath}",
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
