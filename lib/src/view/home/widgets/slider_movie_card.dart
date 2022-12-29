import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:the_movie/src/view/home/widgets/indicator.dart';

import '../../../core/base/singleton/base_singleton.dart';

class SliderMovieCard extends StatefulWidget {
  const SliderMovieCard({
    Key? key,
    required this.children,
    this.width = double.infinity,
    this.height = 200,
    this.initialPage = 0,
    this.onPageChanged,
    this.autoPlayInterval = 2500,
    this.isLoop = true,
  }) : super(key: key);

  final List<Widget> children;
  final double width;
  final double height;
  final int initialPage;
  final ValueChanged<int>? onPageChanged;
  final int? autoPlayInterval;
  final bool isLoop;

  @override
  SliderMovieCardState createState() => SliderMovieCardState();
}

class SliderMovieCardState extends State<SliderMovieCard> with BaseSingleton {
  late final ValueNotifier<int> _currentPageNotifier;
  late final PageController _pageController;
  Timer? _timer;

  void _onPageChanged(int index) {
    _currentPageNotifier.value = index;
    if (widget.onPageChanged != null) {
      final correctIndex = index % widget.children.length;
      widget.onPageChanged!(correctIndex);
    }
  }

  void _autoPlayTimerStart() {
    _timer?.cancel();
    _timer = Timer.periodic(
      Duration(milliseconds: widget.autoPlayInterval!),
      (timer) {
        int nextPage;
        if (widget.isLoop) {
          nextPage = _currentPageNotifier.value + 1;
        } else {
          if (_currentPageNotifier.value < widget.children.length - 1) {
            nextPage = _currentPageNotifier.value + 1;
          } else {
            return;
          }
        }

        goToPage(nextPage);
      },
    );
  }

  void goToPage(int index) {
    if (_pageController.hasClients) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    }
  }

  void stopAutoPlay() {
    _timer?.cancel();
  }

  @override
  void initState() {
    _pageController = PageController(
      initialPage: widget.initialPage,
    );

    _currentPageNotifier = ValueNotifier(widget.initialPage);

    if (widget.autoPlayInterval != null && widget.autoPlayInterval != 0) {
      _autoPlayTimerStart();
    }
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _currentPageNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [
          PageView.builder(
            scrollBehavior: const ScrollBehavior().copyWith(
              scrollbars: false,
              dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
              },
            ),
            onPageChanged: _onPageChanged,
            itemCount: widget.isLoop ? null : widget.children.length,
            controller: _pageController,
            itemBuilder: (context, index) {
              final correctIndex = index % widget.children.length;
              return widget.children[correctIndex];
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 10,
            child: ValueListenableBuilder<int>(
              valueListenable: _currentPageNotifier,
              builder: (context, value, child) {
                return Indicator(
                  count: widget.children.length,
                  currentIndex: value % widget.children.length,
                  activeColor: constants.dodgerBlue,
                  backgroundColor: constants.grey,
                  radius: 3,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
