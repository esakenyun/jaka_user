import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jaka_user/constants/constants.dart';
import 'package:shimmer/shimmer.dart';

class ProductShimmer extends StatelessWidget {
  const ProductShimmer({super.key, required this.itemCount});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    final baseColor = Colors.grey[300]!;
    final highlightColor = Colors.grey[100]!;

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Padding(
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
                      Shimmer.fromColors(
                        baseColor: baseColor,
                        highlightColor: highlightColor,
                        child: Container(
                          height: 200.h,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            color: baseColor,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                      )
                    ],
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
                          Shimmer.fromColors(
                            baseColor: baseColor,
                            highlightColor: highlightColor,
                            child: Container(
                              height: 15.h,
                              width: MediaQuery.of(context).size.width * 0.20,
                              decoration: BoxDecoration(
                                  color: baseColor,
                                  borderRadius: BorderRadius.circular(12.r)),
                            ),
                          ),
                          Shimmer.fromColors(
                            baseColor: baseColor,
                            highlightColor: highlightColor,
                            child: Container(
                              height: 15.h,
                              width: MediaQuery.of(context).size.width * 0.20,
                              decoration: BoxDecoration(
                                  color: baseColor,
                                  borderRadius: BorderRadius.circular(12.r)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Shimmer.fromColors(
                            baseColor: baseColor,
                            highlightColor: highlightColor,
                            child: Container(
                              height: 15.h,
                              width: MediaQuery.of(context).size.width * 0.25,
                              decoration: BoxDecoration(
                                  color: baseColor,
                                  borderRadius: BorderRadius.circular(12.r)),
                            ),
                          ),
                          Shimmer.fromColors(
                            baseColor: baseColor,
                            highlightColor: highlightColor,
                            child: Container(
                              height: 15.h,
                              width: MediaQuery.of(context).size.width * 0.15,
                              decoration: BoxDecoration(
                                color: baseColor,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

//Sebelum 
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:shimmer/shimmer.dart';

// class MerchantShimmer extends StatelessWidget {
//   const MerchantShimmer({super.key, required this.itemCount});

//   final int itemCount;

//   @override
//   Widget build(BuildContext context) {
//     final baseColor = Colors.grey[300]!;
//     final highlightColor = Colors.grey[100]!;

//     return ListView.builder(
//       scrollDirection: Axis.horizontal,
//       itemCount: itemCount,
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: EdgeInsets.only(right: 12.w),
//           child: Shimmer.fromColors(
//             baseColor: baseColor,
//             highlightColor: highlightColor,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: baseColor,
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               width: MediaQuery.of(context).size.width * 0.75,
//               height: MediaQuery.of(context).size.width * 0.7,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
