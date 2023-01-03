import 'package:flutter/material.dart';
import '../../../core/base/models/movie_model.dart';
import '../../../core/components/movie_list_tile/movie_list_tile.dart';
import '../../../core/components/animations/animatedLists/animated_scroll_view_item.dart';

class AnimatedMovieListView extends StatefulWidget {
  const AnimatedMovieListView({
    Key? key,
    this.itemCount = 10,
    required this.movies,
  }) : super(key: key);

  final int? itemCount;
  final List<MovieModel> movies;

  @override
  State<AnimatedMovieListView> createState() => _AnimatedMovieListViewState();
}

class _AnimatedMovieListViewState extends State<AnimatedMovieListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      cacheExtent: 0,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.itemCount,
      itemBuilder: (context, index) => AnimatedScrollViewItem(
        child: MovieListTile(
          movies: widget.movies,
          index: index,
        ),
      ),
    );
  }
}
