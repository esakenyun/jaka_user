import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jaka_user/common/appstyle.dart';
import 'package:jaka_user/constants/constants.dart';
import 'package:jaka_user/pages/profile/widget/profile_detail_item.dart';
import 'package:jaka_user/pages/profile/widget/profile_edit_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileDetailPage extends StatefulWidget {
  const ProfileDetailPage({super.key});

  @override
  State<ProfileDetailPage> createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {
  late String name = '';
  late String phone = '';
  late String nim = '';
  late String email = '';

  @override
  void initState() {
    super.initState();
    loadDataUser();
  }

  Future<void> loadDataUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userDataJson = prefs.getString('userData');
    if (userDataJson != null) {
      final userData = json.decode(userDataJson);
      setState(() {
        name = userData['user']['name'];
        phone = userData['user']['phone'];
        nim = userData['user']['nim'];
        email = userData['user']['email'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.black,
        title: Text(
          'Settings',
          style: appstyle(15, AppColors.black, FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Get.to(
                () => const ProfilEditPage(),
                transition: Transition.fadeIn,
                duration: const Duration(milliseconds: 900),
              );
            },
            child: Text(
              'Edit',
              style: appstyle(
                13,
                AppColors.primary,
                FontWeight.w600,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 20.h,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: AppColors.primary,
                              backgroundImage:
                                  const AssetImage('assets/avatar_profile.jpg'),
                              radius: 50.r,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              name,
                              style: appstyle(
                                  20, AppColors.black, FontWeight.bold),
                              softWrap: true,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              nim,
                              style:
                                  appstyle(13, AppColors.grey, FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ProfileItem(
                              title: 'Fullname',
                              value: name,
                            ),
                            ProfileItem(
                              title: 'NIM',
                              value: nim,
                            ),
                            ProfileItem(
                              title: 'Phone Number',
                              value: phone,
                            ),
                            ProfileItem(
                              title: 'Email',
                              value: email,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
