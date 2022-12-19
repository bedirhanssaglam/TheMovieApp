import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';
import 'package:the_movie/src/core/components/text/custom_text.dart';
import 'package:the_movie/src/core/extensions/num_extensions.dart';

import '../../core/components/movie_list_tile/movie_list_tile.dart';

class NowPlayingMoviesView extends StatefulWidget {
  const NowPlayingMoviesView({super.key});

  @override
  State<NowPlayingMoviesView> createState() => _NowPlayingMoviesViewState();
}

class _NowPlayingMoviesViewState extends State<NowPlayingMoviesView> {
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
                "Now Playing Movies",
                textStyle: context.textTheme.headline2,
              ),
              3.h.ph,
              const MovieListTile(),
            ],
          ),
        ),
      ),
    );
  }
}
