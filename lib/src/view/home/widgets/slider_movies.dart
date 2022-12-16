import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:the_movie/src/view/home/widgets/slider_movie_card.dart';

import '../../../core/constants/app/app_constants.dart';

class SliderMovies extends StatelessWidget {
  final double width;
  final double height;
  final double radius;

  const SliderMovies({
    Key? key,
    this.width = 0.9,
    this.height = 0.2,
    this.radius = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 20.h,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: SliderMovieCard(
        children: [
          Container(
            height: 20.h,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          Container(
            height: 20.h,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          Container(
            height: 20.h,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ],
      ),
    );
  }
}
