import 'package:astroquiz/screens/sign_in_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/colors.dart';
import '../config/fonts.dart';
import '../config/images.dart';
import '../config/strings.dart';
import '../controller/profile_controller.dart';
import '../data/model/user_model.dart';
import '../data/repository/auth_repository.dart';
import '../user_local_services/user_local_service.dart';
import 'widget/history_list_tile.dart';
import 'widget/profile_header.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        width: Get.width,
        height: Get.height,
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(MyImages.commonBg), fit: BoxFit.fill)),
        child: StreamBuilder<DocumentSnapshot>(
          stream: profileController.getProfile(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              UserData userData = UserData.fromJson(snapshot.data.data());
              userData.history?.sort(
                (a, b) => DateTime.parse(b.date ?? "")
                    .compareTo(DateTime.parse(a.date ?? "")),
              );
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    constraints: const BoxConstraints(),
                    icon: const Icon(Icons.arrow_back),
                    color: AppColors.white,
                  ),
                  SizedBox(width: double.infinity ,
                    child: ProfileHeader(
                        email: userData.email ?? "", name: userData.name ?? ""),
                  ),
                  const SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: SizedBox(
                      width: Get.width,
                      child: Text(
                        StringConst.history,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: AppColors.whiteTxtColor,
                            fontSize: 20,
                            fontFamily: MyFonts.nunito,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemCount: userData.history?.length ?? 0,
                    itemBuilder: (context, index) {
                      var history = userData.history?[index];
                      return HistoryListTile(
                        date: history?.date ?? "",
                        level: history?.level ?? "",
                        percentage: history?.percentage ?? "",
                        correctAnswer: history?.correctAnswer ?? 0,
                        totalQuestion: history?.totalQuestion ?? 0,
                        type: history?.type ?? "",
                      );
                    },
                  )),
                  const SizedBox(height: 15.0),
                  GestureDetector(
                    onTap: () async {
                      await AuthRepository.signOut().then((value) {
                        UserLocalService.clearLocal();
                        Get.offAll(const SignInScreen());
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: SizedBox(
                        width: Get.width,
                        child: const Text(
                          StringConst.logOut,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.red,
                              fontSize: 20,
                              fontFamily: MyFonts.nunito,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
