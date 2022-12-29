import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

import '../../base/singleton/base_singleton.dart';
import '../../init/utils/typedefs.dart';

class TextFormFieldWidget extends StatefulWidget {
  final String? hintText;
  final StringFunction onSaved;
  final TextInputType? textInputType;
  final TextEditingController? textEditingController;
  final FormFieldValidator<String>? validator;
  final void Function(String)? onSubmitted;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;

  const TextFormFieldWidget({
    Key? key,
    this.hintText,
    this.onSaved,
    this.textInputType = TextInputType.text,
    this.textEditingController,
    this.validator,
    this.onSubmitted,
    this.textInputAction,
    this.suffixIcon,
  }) : super(key: key);

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget>
    with BaseSingleton {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: widget.textInputType,
      autofocus: true,
      onFieldSubmitted: widget.onSubmitted,
      textInputAction: widget.textInputAction,
      style: context.textTheme.headline2?.copyWith(
        fontSize: 12.sp,
      ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: widget.suffixIcon,
        filled: true,
        fillColor: constants.outerSpace,
        hoverColor: constants.dodgerBlue,
        contentPadding: EdgeInsets.all(8.sp),
        hintStyle: context.textTheme.subtitle2?.copyWith(
          color: constants.gray,
          fontSize: 12.sp,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide.none,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: constants.carnation),
        ),
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide.none,
        ),
      ),
      onSaved: (value) {
        widget.onSaved != null ? widget.onSaved!(value) : null;
      },
      validator: widget.validator,
    );
  }
}
