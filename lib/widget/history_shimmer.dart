import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jaka_user/constants/constants.dart';
import 'package:shimmer/shimmer.dart';

class HistoryShimmer extends StatelessWidget {
  const HistoryShimmer({super.key, required this.itemCount});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    final baseColor = Colors.grey[300]!;
    final highlightColor = Colors.grey[100]!;

    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 1,
                      blurRadius: 5,
                      color: Colors.grey.withOpacity(0.8),
                      offset: const Offset(1, 2),
                    )
                  ],
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.h, vertical: 20.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: ClipOval(
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
                      ),
                      SizedBox(
                        width: 5.h,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
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
                            SizedBox(
                              height: 5.h,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
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
                              height: 5.h,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
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
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
            ],
          );
        });
  }
}
