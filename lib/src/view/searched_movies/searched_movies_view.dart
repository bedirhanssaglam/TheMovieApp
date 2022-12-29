import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:the_movie/src/core/base/cubit/movie_cubit.dart';
import 'package:the_movie/src/core/base/services/movie_service.dart';
import 'package:the_movie/src/core/components/appbar/custom_app_bar.dart';
import 'package:the_movie/src/core/components/movie_list_tile/movie_list_tile.dart';
import 'package:the_movie/src/core/extensions/num_extensions.dart';
import 'package:the_movie/src/view/searched_movies/widgets/animated_rich_text.dart.dart';

import '../../core/base/models/movie_model.dart';
import '../../core/base/singleton/base_singleton.dart';

class SearchedMoviesView extends StatefulWidget {
  const SearchedMoviesView({
    super.key,
    required this.searchWord,
  });

  final String searchWord;

  @override
  State<SearchedMoviesView> createState() => _SearchedMoviesViewState();
}

class _SearchedMoviesViewState extends State<SearchedMoviesView>
    with BaseSingleton {
  late MovieCubit movieCubit;

  @override
  void initState() {
    super.initState();
    movieCubit = MovieCubit(MovieService(vexana.networkManager));
    movieCubit.fetchSearchedMovie(widget.searchWord);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isDetailOrSearchView: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              3.h.ph,
              AnimatedRichText(
                firstText: "Movies about the ",
                secondText: widget.searchWord,
                secondTextColor: constants.malibu,
              ),
              3.h.ph,
              BlocBuilder<MovieCubit, MovieState>(
                bloc: movieCubit,
                builder: (context, state) {
                  if (state is FetchSearchedMovieLoading) {
                    return functions.platformIndicator();
                  } else if (state is FetchSearchedMovieLoaded) {
                    final List<MovieModel> movies = state.movies;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.movies.length,
                      itemBuilder: (context, index) {
                        return MovieListTile(
                          movies: movies,
                          index: index,
                        );
                      },
                    );
                  } else if (state is FetchSearchedMovieError) {
                    return functions.errorText(state.errorMessage);
                  } else {
                    return functions.errorText("Something went wrong!");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
