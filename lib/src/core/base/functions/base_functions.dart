import 'dart:core';
import 'dart:io';
import 'dart:developer' as developer;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../components/text/custom_text.dart';

Widget platformIndicator() {
  return Center(
    child: Platform.isIOS
        ? const CupertinoActivityIndicator()
        : const CircularProgressIndicator(),
  );
}

IconButton platformBackButton({
  required VoidCallback onPressed,
  Color? color = Colors.grey,
}) {
  return Platform.isIOS
      ? IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.arrow_back_ios,
            color: color,
          ),
        )
      : IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.arrow_back,
            color: color,
          ),
        );
}

Icon platformForwardIcon() {
  return Platform.isIOS
      ? const Icon(Icons.arrow_forward_ios)
      : const Icon(Icons.arrow_forward);
}

Widget errorText(String errorMessage) {
  return Center(child: CustomText(errorMessage));
}

logControl(String message) {
  developer.log(message);
}

animatedRouting({
  required GoRouterState state,
  required Widget route,
}) =>
    CustomTransitionPage<void>(
      key: state.pageKey,
      child: route,
      transitionsBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation, Widget child) =>
          SlideTransition(
        position: animation.drive(
          Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.fastOutSlowIn)),
        ),
        child: child,
      ),
    );

closePopup(BuildContext context) {
  Navigator.of(context, rootNavigator: true).pop();
}

String toShortString(String value, {int countCharacter = 23}) {
  return value.length > countCharacter
      ? "${value.substring(0, countCharacter)}..."
      : value;
}

String toShortDoubleNumber(double value) {
  String number = value.toString();
  return "${number.split(".").first}.${number.split(".")[1].substring(0, 1)}";
}
