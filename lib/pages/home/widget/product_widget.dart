import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jaka_user/common/appstyle.dart';
import 'package:jaka_user/constants/constants.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.price,
      this.onTap});

  final String image;
  final String title;
  final String price;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: 12.w),
        child: Container(
          width: MediaQuery.of(context).size.width * .75,
          height: 180.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: AppColors.brokenwhite,
          ),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.all(8.w),
                child: ClipRRect(
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
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: appstyle(12, AppColors.black, FontWeight.w500),
                        ),
                        Text(
                          "Rp$price",
                          style:
                              appstyle(12, AppColors.primary, FontWeight.w600),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery Time',
                          style: appstyle(9, AppColors.grey, FontWeight.w500),
                        ),
                        Text(
                          'sadsa',
                          style: appstyle(9, AppColors.black, FontWeight.w500),
                        )
                      ],
                    ),
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
