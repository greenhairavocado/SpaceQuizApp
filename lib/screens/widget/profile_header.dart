import 'package:flutter/material.dart';

import '../../config/colors.dart';
import '../../config/fonts.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String email;

  const ProfileHeader({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50.0,
            backgroundColor: AppColors.btnColor.withOpacity(0.5),
            child: Image.asset("assets/images/img-quiz_icon.png"),
          ),
          const SizedBox(height: 10.0),
          Text(
            name,
            style: const TextStyle(
                color: AppColors.selectedColor,
                fontSize: 25,
                fontFamily: MyFonts.nunito,
                fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 5.0),
          Text(
            email,
            style: TextStyle(
                color: AppColors.whiteTxtColor,
                fontSize: 16,
                fontFamily: MyFonts.nunito,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
