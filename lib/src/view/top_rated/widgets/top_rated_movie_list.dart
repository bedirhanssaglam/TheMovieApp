import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/base/models/movie_model.dart';
import 'top_rated_movie_card.dart';

class TopRatedMovieList extends StatelessWidget {
  const TopRatedMovieList({
    Key? key,
    required this.movies,
  }) : super(key: key);

  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 4.w),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 1.h,
        ),
        itemCount: 14,
        itemBuilder: (context, index) {
          return TopRatedMovieCard(
            movies: movies,
            index: index,
          );
        },
      ),
    );
  }
}
