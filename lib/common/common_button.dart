import 'package:astroquiz/common/text.dart';
import 'package:astroquiz/config/fonts.dart';
import 'package:flutter/material.dart';
import '../config/colors.dart';

class CommonButton extends StatelessWidget {
  final String btnText;
  final Color? color;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? fontSize;
  final GestureTapCallback? onTap;

  const CommonButton(
      {required this.btnText,
      this.color,
      this.width,
      this.height,
      this.borderRadius,
      this.textColor,
      this.fontSize,
      this.onTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height??40,
        width: width ?? MediaQuery.of(context).size.width * 0.45,
        decoration:  BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            color: color ?? AppColors.btnColor),
        child: Center(
          child: text(
              text: btnText,
              style:  TextStyle(
                  color: textColor ?? AppColors.whiteTxtColor,
                  fontSize: fontSize ?? 18,
                  fontFamily: MyFonts.nunito,
                  fontWeight: FontWeight.w700)),
        ),
      ),
    );
  }
}
