import 'package:flutter/material.dart';

import '../../config/colors.dart';
import '../config/fonts.dart';

class EmptyMessageScreen extends StatelessWidget {
  final String message;
  final String image;
  final double? height;
  final double? width;
  final Color? color;

  const EmptyMessageScreen(
      {Key? key,
        required this.image,
        required this.message,
        this.height,
        this.width,this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Image.asset(
            image,
            height: height ?? 150,
            width: width ?? 150,
            color: color,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(message,
            textAlign: TextAlign.center,
            maxLines: 2,
            style:  const TextStyle(
              fontSize: 16,
                fontFamily: MyFonts.gilroy,
                color: AppColors.white,
                fontWeight: FontWeight.w400)),
      ],
    );
  }
}
