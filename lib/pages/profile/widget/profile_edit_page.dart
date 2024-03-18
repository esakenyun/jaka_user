import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jaka_user/common/appstyle.dart';
import 'package:jaka_user/constants/constants.dart';
import 'package:jaka_user/pages/profile/widget/profile_edit_textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilEditPage extends StatefulWidget {
  const ProfilEditPage({super.key});

  @override
  State<ProfilEditPage> createState() => _ProfilEditPageState();
}

class _ProfilEditPageState extends State<ProfilEditPage> {
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
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.black,
        elevation: 0,
        title: Text(
          'Edit Profile',
          style: appstyle(
            15,
            AppColors.black,
            FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Done',
              style: appstyle(
                13,
                AppColors.primary,
                FontWeight.w600,
              ),
            ),
          ),
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
                            GestureDetector(
                              onTap: () {
                                print('ganti foto');
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: 125,
                                    height: 125,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/avatar_profile.jpg'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 2, sigmaY: 2),
                                      child: Container(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),

                            // CircleAvatar(
                            //   backgroundColor: AppColors.primary,
                            //   backgroundImage:
                            //       const AssetImage('assets/avatar_profile.jpg'),
                            //   radius: 50.r,
                            //   child: const Icon(
                            //     CupertinoIcons.pencil,
                            //   ),
                            // ),
                            const SizedBox(
                              height: 10,
                            ),
                            // TextButton(
                            //   onPressed: () {},
                            //   style: TextButton.styleFrom(
                            //       backgroundColor: AppColors.primary),
                            //   child: Text(
                            //     'Edit Photo',
                            //     style: appstyle(
                            //         12, AppColors.white, FontWeight.bold),
                            //   ),
                            // ),
                            const SizedBox(
                              height: 30,
                            ),
                            ProfileTextField(
                              title: 'Fullname',
                              controller: TextEditingController(text: name),
                              cursorColor: AppColors.black,
                            ),
                            ProfileTextField(
                              title: 'NIM',
                              controller: TextEditingController(text: nim),
                              cursorColor: AppColors.black,
                            ),
                            ProfileTextField(
                              title: 'Phone Number',
                              controller: TextEditingController(text: phone),
                              cursorColor: AppColors.black,
                            ),
                            ProfileTextField(
                              title: 'Email',
                              controller: TextEditingController(text: email),
                              cursorColor: AppColors.black,
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
