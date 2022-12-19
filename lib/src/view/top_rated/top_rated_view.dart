import 'package:flutter/material.dart';
import 'package:the_movie/src/core/components/text/custom_text.dart';

class TopRatedView extends StatefulWidget {
  const TopRatedView({super.key});

  @override
  State<TopRatedView> createState() => _TopRatedViewState();
}

class _TopRatedViewState extends State<TopRatedView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CustomText(
          "Top Rated",
        ),
      ),
    );
  }
}
