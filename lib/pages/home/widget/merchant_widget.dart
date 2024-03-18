import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jaka_user/common/appstyle.dart';
import 'package:jaka_user/constants/constants.dart';

class MerchantWidget extends StatelessWidget {
  const MerchantWidget({
    super.key,
    required this.image,
    required this.name,
    required this.ratingCount,
    required this.rating,
    required this.address,
    this.onTap,
  });

  final String image;
  final String name;
  final String address;
  final String ratingCount;
  final double rating;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: 12.w),
        child: Container(
          width: MediaQuery.of(context).size.width * .75,
          height: 192.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: AppColors.brokenwhite,
          ),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.all(8.w),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: SizedBox(
                        height: 200.h,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Image.network(
                          image,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: appstyle(12, AppColors.black, FontWeight.w500),
                    ),
                    Row(
                      children: [
                        RatingBarIndicator(
                          rating: rating,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: AppColors.primary,
                          ),
                          itemCount: 5,
                          itemSize: 15.h,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          "+ $ratingCount ratings",
                          style: appstyle(9, AppColors.grey, FontWeight.w500),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
