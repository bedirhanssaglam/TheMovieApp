import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/base/models/genres_model.dart';
import '../../../core/base/singleton/base_singleton.dart';
import '../../../core/components/animations/animatedLists/animated_scroll_view_item.dart';
import 'circular_categories.dart';

class AnimatedGenresList extends StatefulWidget {
  const AnimatedGenresList({
    Key? key,
    this.height = 16,
    this.itemCount = 10,
    required this.genres,
  }) : super(key: key);

  final double? height;
  final int? itemCount;
  final List<GenresModel> genres;

  @override
  State<AnimatedGenresList> createState() => _AnimatedGenresListState();
}

class _AnimatedGenresListState extends State<AnimatedGenresList>
    with BaseSingleton {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height?.h,
      child: ListView.builder(
        cacheExtent: 0,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: EdgeInsets.only(right: 2.w),
        itemCount: widget.itemCount,
        itemBuilder: (context, index) {
          return AnimatedScrollViewItem(
            child: CircularCategories(
              image:
                  "${constants.baserUrlForImage}/tmU7GeKVybMWFButWEGl2M4GeiP.jpg",
              text: "${widget.genres[index].name}",
            ),
          );
        },
      ),
    );
  }
}
