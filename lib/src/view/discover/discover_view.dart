import 'package:flutter/material.dart';
import 'package:the_movie/src/core/components/text/custom_text.dart';

class DiscoverView extends StatefulWidget {
  const DiscoverView({super.key});

  @override
  State<DiscoverView> createState() => _DiscoverViewState();
}

class _DiscoverViewState extends State<DiscoverView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CustomText(
          "Discover",
        ),
      ),
    );
  }
}
