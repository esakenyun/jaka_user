import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jaka_user/common/appstyle.dart';
import 'package:jaka_user/constants/constants.dart';
import 'package:jaka_user/model/history.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({super.key, required this.order});

  final HistoryOrder order;

  @override
  Widget build(BuildContext context) {
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
            padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 20.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/orders.png',
                  height: 70,
                  width: 70,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 10.h,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'nama',
                              style: appstyle(
                                  15, AppColors.black, FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            'harga',
                            style:
                                appstyle(13, Colors.black54, FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.directions_walk_outlined,
                            color: AppColors.black,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            'Order Active',
                            style:
                                appstyle(13, AppColors.grey, FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        'Kantin Bahar',
                        style: appstyle(13, Colors.black54, FontWeight.normal),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
