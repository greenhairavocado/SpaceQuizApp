import 'package:astroquiz/config/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../config/colors.dart';

class CommonTextField extends StatelessWidget {
  final EdgeInsets? contentPadding;
  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final Function()? onEditingComplete;
  final ValueChanged<String>? onSubmitAction;
  final Function()? onTap;
  final Function(String?)? onChanged;
  final Widget? prefix;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final bool enableInteractiveSelection;
  final bool readOnly;
  final int? maxLength;
  final int maxLines;
  final TextAlign textAlign;
  final TextCapitalization textCapitalization;
  final BorderRadius? borderRadius;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Color? fillColor;
  final Color? bgColor;
  final bool? doneButtonShow;
  final FocusNode? focusNodeV;
  final TapRegionCallback? onTapOutSide;
  final bool? autofocusValue;
  final bool? filled;

  CommonTextField({super.key,
    required this.hintText,
    this.controller,
    this.textStyle,
    this.contentPadding,
    this.textInputAction,
    this.onEditingComplete,
    this.onTap,
    this.bgColor,
    this.onChanged,
    this.obscureText,
    this.keyboardType,
    this.prefix,
    this.fillColor,
    this.suffix,
    this.validator,
    this.hintStyle,
    this.enableInteractiveSelection = true,
    this.readOnly = false,
    this.maxLength,
    this.maxLines = 1,
    this.textAlign = TextAlign.start,
    this.textCapitalization = TextCapitalization.none,
    this.borderRadius,
    this.doneButtonShow = true,
    this.focusNodeV,
    this.onSubmitAction,
    this.onTapOutSide,
    this.autofocusValue,
    this.filled,
  });

  final FocusNode _nodeText1 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.btnColor,
      textCapitalization: textCapitalization,
      inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],
      controller: controller,
      validator: validator,
      maxLines: maxLines,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      autofocus: autofocusValue ?? false,
      readOnly: readOnly,
      enableInteractiveSelection: enableInteractiveSelection,
      textAlign: textAlign,
      textInputAction: textInputAction ?? TextInputAction.next,
      onTap: onTap,
      onChanged: onChanged,
      onTapOutside: onTapOutSide,
      style: textStyle ??
          TextStyle(
            fontSize: 15,
            color: AppColors.hintColor.withOpacity(0.5),
            fontFamily: MyFonts.nunito,
          ),
      onEditingComplete:
          onEditingComplete ?? () => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
          prefixIcon: prefix,
          suffixIcon: suffix,
          suffixIconConstraints:
              const BoxConstraints(minWidth: 0, minHeight: 0),
          hintText: hintText,
          hintStyle: hintStyle ??
              TextStyle(
                fontSize: 15,
                color: AppColors.hintColor.withOpacity(0.5),
                fontFamily: MyFonts.nunito,
              ),
          isDense: true,
          contentPadding: contentPadding ??
              const EdgeInsets.only(
                left: 10,
                top: 10,
              ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(8.0),
            borderSide: BorderSide(color: bgColor ?? Colors.red),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(8.0),
            borderSide: BorderSide(color: bgColor ?? Colors.red),
          ),
          filled: filled ?? false,
          fillColor: bgColor ?? AppColors.white,
          enabled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.1),
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.1),
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.1),
            ),
            borderRadius: BorderRadius.circular(15.0),
          )),
    );
  }
}
