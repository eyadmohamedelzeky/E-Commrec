import 'package:ecommerce/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    this.borderRadius,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.textFieldColor,
    super.key,
    this.colorBorderSide,
    this.filled,
    this.autovalidateMode,
    this.autocorrect,
    this.controller,
    this.enableSuggestions,
    this.expands,
    this.keyboardAppearance,
    this.keyboardType,
    this.inputFormatters,
    this.obscureText,
    this.onChanged,
    this.onSaved,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.maxLines,
    this.minLines,
    this.onTap,
    this.autofocus,
    this.enabled,
    this.canRequestFocus,
    this.obscuringCharacter,
    this.scrollController,
    this.validator,
  });
  final String? hintText;
  final Widget? prefixIcon;
  final Color? textFieldColor;
  final BorderRadius? borderRadius;
  final Widget? suffixIcon;
  final Color? colorBorderSide;
  final bool? filled;
  final AutovalidateMode? autovalidateMode;
  final bool? autocorrect;
  final TextEditingController? controller;
  final bool? enableSuggestions;
  final bool? expands;
  final Brightness? keyboardAppearance;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool? obscureText;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final int? maxLines;
  final int? minLines;
  final void Function()? onTap;
  final bool? autofocus;
  final bool? enabled;
  final bool? canRequestFocus;
  final String? obscuringCharacter;
  final ScrollController? scrollController;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      scrollController: scrollController,
      obscuringCharacter: obscuringCharacter ?? '#',
      canRequestFocus: canRequestFocus ?? true,
      enabled: enabled,
      autofocus: autofocus ?? false,
      onTap: onTap,
      minLines: minLines,
      maxLines: maxLines,
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
      onSaved: onSaved,
      onChanged: onChanged,
      obscureText: obscureText ?? false,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      keyboardAppearance: keyboardAppearance,
      expands: expands ?? false,
      enableSuggestions: enableSuggestions ?? true,
      controller: controller,
      autocorrect: autocorrect ?? true,
      autovalidateMode: autovalidateMode,
      cursorColor: kMainColor,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        fillColor: textFieldColor,
        filled: filled,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorBorderSide ?? whiteColor,
          ),
          borderRadius: borderRadius ?? BorderRadius.circular(20.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorBorderSide ?? whiteColor,
          ),
          borderRadius: borderRadius ?? BorderRadius.circular(20.r),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
