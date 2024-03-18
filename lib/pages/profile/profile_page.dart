import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jaka_user/common/appstyle.dart';
import 'package:jaka_user/common/custom_container.dart';
import 'package:jaka_user/constants/constants.dart';
import 'package:jaka_user/pages/auth/signin_page.dart';
import 'package:jaka_user/pages/profile/widget/menu_profile.dart';
import 'package:jaka_user/pages/profile/widget/profile_detail_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late String name = '';
  late String phone = '';

  @override
  void initState() {
    super.initState();
    loadUsername();
  }

  Future<void> loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userDataJson = prefs.getString('userData');
    if (userDataJson != null) {
      final userData = json.decode(userDataJson);
      setState(() {
        name = userData['user']['name'];
        phone = userData['user']['phone'];
      });
    }
  }

  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userDataJson = prefs.getString('userData');
    if (userDataJson != null) {
      final token = json.decode(userDataJson)['token'];
      print('Token sebelum dihapus: $token');
    }
    await prefs.clear();
    // Setelah menghapus, pastikan token tidak lagi tersedia
    final userDataJsonAfterClear = prefs.getString('userData');
    final tokenAfterClear = userDataJsonAfterClear != null
        ? json.decode(userDataJsonAfterClear)['token']
        : null;
    print('Token setelah dihapus: $tokenAfterClear');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 1,
        title: Text(
          'Profile',
          style: appstyle(22, AppColors.black, FontWeight.bold),
        ),
      ),
      body: SafeArea(
          child: CustomContainer(
        color: Colors.grey.shade200,
        containerContent: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(
                  () => const ProfileDetailPage(),
                  transition: Transition.fade,
                  duration: const Duration(milliseconds: 900),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.h,
                  vertical: 10.h,
                ),
                color: AppColors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 37.r,
                      backgroundImage:
                          const AssetImage('assets/avatar_profile.jpg'),
                    ),
                    SizedBox(
                      width: 10.h,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style:
                                appstyle(16, AppColors.black, FontWeight.bold),
                          ),
                          Text(
                            phone,
                            style:
                                appstyle(13, AppColors.grey, FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    const Icon(
                      CupertinoIcons.forward,
                      color: AppColors.grey,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: Column(
                children: [
                  const ProfileMenu(
                    title: 'Document Management',
                    icon: CupertinoIcons.doc_person,
                    color: Colors.white,
                    backgroundColor: Colors.green,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  const ProfileMenu(
                    title: 'Notifications',
                    icon: CupertinoIcons.bell_fill,
                    color: AppColors.white,
                    backgroundColor: AppColors.primary,
                  ),
                  const ProfileMenu(
                    title: 'Term & Privacy',
                    icon: CupertinoIcons.exclamationmark_octagon,
                    color: AppColors.white,
                    backgroundColor: AppColors.grey,
                  ),
                  const ProfileMenu(
                    title: 'Contact Us',
                    icon: CupertinoIcons.chat_bubble_2_fill,
                    color: AppColors.white,
                    backgroundColor: Colors.redAccent,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ProfileMenu(
                      // onTap: () async {
                      //   await _logout();
                      //   Get.offAll(
                      //     () => const SignInPage(),
                      //   );
                      // },
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              title: Text(
                                'Konfirmasi Logout',
                                style: appstyle(
                                    17, AppColors.black, FontWeight.bold),
                              ),
                              content:
                                  const Text('Apakah Anda Yakin ingin Logout?'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () async {
                                    await _logout();
                                    Get.offAll(
                                      () => const SignInPage(),
                                    );
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.h, vertical: 3.h),
                                    decoration: const BoxDecoration(
                                      color: Colors.redAccent,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                    child: const Text(
                                      'Ya',
                                      style: TextStyle(color: AppColors.white),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'Tidak',
                                    style: TextStyle(color: AppColors.black),
                                  ),
                                )
                                // TextButton(
                                //   onPressed: () {
                                //     Navigator.of(context).pop();
                                //   },
                                //   child: const Text(
                                //     'Tidak',
                                //     style: TextStyle(color: AppColors.black),
                                //   ),
                                // ),
                              ],
                            );
                          },
                        );
                      },
                      title: 'Logout',
                      icon: Icons.logout_outlined,
                      color: AppColors.white,
                      backgroundColor: Colors.deepOrangeAccent)
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
