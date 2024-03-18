import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jaka_user/constants/constants.dart';
import 'package:shimmer/shimmer.dart';

class AllProductShimmer extends StatelessWidget {
  const AllProductShimmer({super.key, required this.itemCount});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    final baseColor = Colors.grey[300]!;
    final highlightColor = Colors.grey[100]!;
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Padding(
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
                                child: Shimmer.fromColors(
                                  baseColor: baseColor,
                                  highlightColor: highlightColor,
                                  child: Container(
                                    color: baseColor,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
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
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: 15,
                              child: Shimmer.fromColors(
                                baseColor: baseColor,
                                highlightColor: highlightColor,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    color: baseColor,
                                  ),
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.15,
                              height: 15,
                              child: Shimmer.fromColors(
                                baseColor: baseColor,
                                highlightColor: highlightColor,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    color: baseColor,
                                  ),
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 5.w,
                  top: 10.h,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: 15,
                    child: Shimmer.fromColors(
                      baseColor: baseColor,
                      highlightColor: highlightColor,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: baseColor,
                        ),
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
