import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:kartal/kartal.dart';
import 'package:the_movie/src/core/components/appbar/custom_app_bar.dart';
import 'package:the_movie/src/core/components/text/custom_text.dart';
import 'package:the_movie/src/core/extensions/num_extensions.dart';

import '../../core/components/movie_card/movie_card.dart';
import '../../core/constants/app/app_constants.dart';
import 'widgets/banner_title.dart';
import 'widgets/circular_categories.dart';
import 'widgets/slider_movies.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              4.h.ph,
              _circularCategoriesList(),
              3.h.ph,
              const SliderMovies(),
              5.h.ph,
              BannerTitle(
                firstText: "Recommended ",
                secondText: "Movies",
                firstTextColor: AppConstants.instance.dodgerBlue,
                secondTextColor: AppConstants.instance.malibu,
              ),
              4.h.ph,
              SizedBox(
                height: 20.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 3.w),
                      child: const MovieCard(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _circularCategoriesList() {
    return SizedBox(
      height: 16.h,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        padding: EdgeInsets.only(right: 2.w),
        itemBuilder: (context, index) {
          return CircularCategories(
            image:
                "${AppConstants.instance.baserUrlForImage}tmU7GeKVybMWFButWEGl2M4GeiP.jpg",
            text: "Action",
          );
        },
      ),
    );
  }
}
