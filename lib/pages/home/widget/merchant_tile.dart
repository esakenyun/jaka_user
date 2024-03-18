import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jaka_user/common/appstyle.dart';
import 'package:jaka_user/constants/constants.dart';

class MerchantTile extends StatelessWidget {
  const MerchantTile(
      {super.key,
      required this.merchantId,
      required this.name,
      required this.imageURL,
      required this.address,
      required this.rating});

  final String merchantId;
  final String name;
  final String imageURL;
  final String address;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("ini $merchantId");
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.h),
        child: Container(
          margin: EdgeInsets.only(bottom: 8.h),
          height: 70.h,
          decoration: BoxDecoration(
            color: AppColors.brokenwhite,
            borderRadius: BorderRadius.circular(9.r),
          ),
          child: Container(
            padding: EdgeInsets.all(4.r),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.r),
                  ),
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 70.w,
                        height: 70.h,
                        child: Image.network(
                          imageURL,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: appstyle(13, AppColors.black, FontWeight.w500),
                    ),
                    Text(
                      address,
                      style: appstyle(12, AppColors.grey, FontWeight.w400),
                    ),
                    SizedBox(
                      height: 10.h,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
