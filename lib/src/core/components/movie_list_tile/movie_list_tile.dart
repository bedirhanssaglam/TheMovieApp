import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';
import 'package:the_movie/src/core/extensions/num_extensions.dart';

import '../../../core/components/text/custom_text.dart';
import '../../base/models/movie_model.dart';
import '../../base/singleton/base_singleton.dart';
import '../animations/animationUtils/animate_in_effect.dart';

class MovieListTile extends StatelessWidget with BaseSingleton {
  const MovieListTile({
    Key? key,
    required this.movies,
    required this.index,
  }) : super(key: key);

  final List<MovieModel> movies;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: InkWell(
        onTap: () {
          context.go('/movie-details/${movies[index].id}');
        },
        child: Container(
          height: 15.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: constants.shark,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 5,
              ),
            ],
          ),
          child: Row(
            children: [
              2.w.pw,
              _buildMovieImage(),
              3.w.pw,
              _buildMovieDetails(context),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildMovieImage() {
    return Container(
      height: 13.h,
      width: 26.w,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            "${constants.baserUrlForImage}${movies[index].backdropPath}",
          ),
        ),
      ),
    );
  }

  Widget _buildMovieDetails(BuildContext context) {
    return AnimateInEffect(
      keepAlive: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          1.h.ph,
          CustomText(
            functions.toShortString("${movies[index].title}"),
            textStyle: context.textTheme.headline2,
          ),
          1.h.ph,
          CustomText(
            "Average: ${movies[index].voteAverage}",
          ),
          1.h.ph,
          CustomText(
            "Vote Count : ${movies[index].voteCount}",
          ),
          1.h.ph,
          CustomText(
            "Original Language: ${movies[index].originalLanguage}",
          ),
        ],
      ),
    );
  }
}
