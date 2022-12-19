import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:kartal/kartal.dart';

import 'package:the_movie/src/core/components/text/custom_text.dart';
import 'package:the_movie/src/core/extensions/num_extensions.dart';

import '../../core/components/movie_card/movie_card.dart';

class TopRatedView extends StatefulWidget {
  const TopRatedView({super.key});

  @override
  State<TopRatedView> createState() => _TopRatedViewState();
}

class _TopRatedViewState extends State<TopRatedView> {
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
              _topRatedMovies(),
            ],
          ),
        ),
      ),
    );
  }

  Padding _topRatedMovies() {
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
          return const MovieCard();
        },
      ),
    );
  }
}
