import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jaka_user/common/appstyle.dart';
import 'package:jaka_user/constants/constants.dart';
import 'package:jaka_user/pages/profile/widget/profile_edit_page.dart';

class ProfileItem extends StatelessWidget {
  final String title;
  final String value;

  const ProfileItem({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: appstyle(
              14,
              AppColors.black,
              FontWeight.w500,
            ),
          ),
          Row(
            children: [
              Text(
                value,
                style: appstyle(
                  12,
                  AppColors.grey,
                  FontWeight.normal,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(
                    () => const ProfilEditPage(),
                    transition: Transition.fadeIn,
                    duration: const Duration(milliseconds: 900),
                  );
                },
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.grey,
                  size: 16,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
