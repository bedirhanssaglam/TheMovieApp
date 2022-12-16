import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app/app_constants.dart';
import '../../init/utils/typedefs.dart';

class TextFormFieldWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: textInputType,
      autofocus: true,
      onFieldSubmitted: onSubmitted,
      textInputAction: textInputAction,
      style: context.textTheme.headline2?.copyWith(
        fontSize: 12.sp,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: AppConstants.instance.shark,
        hoverColor: AppConstants.instance.dodgerBlue,
        contentPadding: EdgeInsets.all(8.sp),
        hintStyle: context.textTheme.subtitle2?.copyWith(
          color: AppConstants.instance.gray,
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
          borderSide: BorderSide(color: AppConstants.instance.carnation),
        ),
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide.none,
        ),
      ),
      onSaved: (value) {
        onSaved != null ? onSaved!(value) : null;
      },
      validator: validator,
    );
  }
}
