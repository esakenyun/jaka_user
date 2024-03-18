import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jaka_user/common/appstyle.dart';
import 'package:jaka_user/constants/constants.dart';

class ProductTile extends StatelessWidget {
  const ProductTile(
      {super.key,
      required this.productId,
      required this.price,
      required this.name,
      required this.imageURL});

  final String productId;
  final String price;
  final String name;
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('ini $productId');
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.h),
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            Container(
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
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: appstyle(14, AppColors.black, FontWeight.w400),
                        ),
                        Text(
                          "Enakk",
                          style: appstyle(11, AppColors.grey, FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 5.w,
              top: 6.h,
              child: Text(
                'Rp$price',
                style: appstyle(15, AppColors.primary, FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
