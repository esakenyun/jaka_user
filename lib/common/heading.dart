import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jaka_user/common/appstyle.dart';
import 'package:jaka_user/constants/constants.dart';

class Heading extends StatelessWidget {
  const Heading({super.key, required this.text, this.onTap});

  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 13.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: Text(
              text,
              style: appstyle(20, AppColors.black, FontWeight.bold),
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Icon(
              CupertinoIcons.add,
              color: AppColors.greytext,
              size: 20.sp,
            ),
          )
        ],
      ),
    );
  }
}
