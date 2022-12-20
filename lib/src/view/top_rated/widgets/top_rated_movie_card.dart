import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

import '../../../core/base/models/movie_model.dart';
import '../../../core/components/text/custom_text.dart';
import '../../../core/constants/app/app_constants.dart';

class TopRatedMovieCard extends StatelessWidget {
  const TopRatedMovieCard({
    Key? key,
    required this.movies,
    required this.index,
  }) : super(key: key);

  final List<MovieModel> movies;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go('/movie-details/${movies[index].id}');
      },
      child: Stack(
        children: [
          Container(
            height: 20.h,
            width: 40.w,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "${AppConstants.instance.baserUrlForImage}${movies[index].backdropPath}",
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              height: 4.h,
              width: 30.w,
              decoration: BoxDecoration(
                color: AppConstants.instance.dodgerBlue.withOpacity(.5),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Center(
                child: CustomText(
                  "${movies[index].title}",
                  textStyle: context.textTheme.bodyText2?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
