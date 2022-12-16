import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:the_movie/src/core/extensions/string_extensions.dart';

import '../../base/functions/base_functions.dart';
import '../../constants/app/app_constants.dart';
import '../../constants/enums/icon_enums.dart';
import '../textFormField/text_form_field_widget.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    Key? key,
    this.isHomeView = false,
    this.onTap,
    this.navigatorState,
  }) : super(key: key);

  final bool? isHomeView;
  final VoidCallback? onTap;
  bool isOpenSearch = false;

  late String searchWord;
  final _formKey = GlobalKey<FormState>();
  final GoRouterState? navigatorState;

  @override
  State<AppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..forward();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  Widget build(BuildContext context) {
    return !widget.isOpenSearch
        ? AppBar(
            automaticallyImplyLeading: false,
            leading: widget.isHomeView!
                ? IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      IconEnums.menu.iconName.toSvg,
                      color: AppConstants.instance.grey,
                    ),
                  )
                : platformBackButton(
                    onPressed: widget.onTap ?? () {},
                  ),
            centerTitle: true,
            title: Image.asset(
              IconEnums.appbar.iconName.toPng,
              height: 27.sp,
            ),
            actions: [
              IconButton(
                  icon: SvgPicture.asset(
                    IconEnums.search.iconName.toSvg,
                    color: AppConstants.instance.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      widget.isOpenSearch = !widget.isOpenSearch;
                    });
                  })
            ],
          )
        : AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            actions: [
              IconButton(
                  icon: SvgPicture.asset(IconEnums.search.iconName.toSvg),
                  onPressed: () {
                    _searchWord(context);
                  }),
            ],
            title: Padding(
              padding: EdgeInsets.all(12.sp),
              child: Form(
                key: widget._formKey,
                child: SizeTransition(
                  sizeFactor: _animation,
                  axis: Axis.horizontal,
                  axisAlignment: -1,
                  child: TextFormFieldWidget(
                    onSaved: (value) {
                      widget.searchWord = value ?? "";
                    },
                    onSubmitted: (value) {
                      _searchWord(context);
                    },
                    hintText: "Search...",
                    textInputAction: TextInputAction.search,
                    suffixIcon: widget.isOpenSearch
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  widget.isOpenSearch = !widget.isOpenSearch;
                                });
                              },
                              child: Icon(
                                Icons.close,
                                size: 30,
                                color: AppConstants.instance.grey,
                              ),
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.all(6.sp),
                            child: Icon(
                              Icons.search,
                              size: 15.sp,
                              color: AppConstants.instance.mineShaft,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          );
  }

  void _searchWord(BuildContext context) {
    setState(() {
      widget.isOpenSearch = !widget.isOpenSearch;
      widget._formKey.currentState?.save();
      if (widget.searchWord.isEmpty) {
      } else {}
    });
  }
}
