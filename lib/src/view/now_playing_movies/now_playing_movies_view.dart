import 'package:flutter/material.dart';
import 'package:the_movie/src/core/components/text/custom_text.dart';

class NowPlayingMoviesView extends StatefulWidget {
  const NowPlayingMoviesView({super.key});

  @override
  State<NowPlayingMoviesView> createState() => _NowPlayingMoviesViewState();
}

class _NowPlayingMoviesViewState extends State<NowPlayingMoviesView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CustomText(
          "Now playing movies",
        ),
      ),
    );
  }
}
