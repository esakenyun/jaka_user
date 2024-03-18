import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jaka_user/common/custom_container.dart';
import 'package:jaka_user/common/custom_text_field.dart';
import 'package:jaka_user/common/heading.dart';
import 'package:jaka_user/constants/constants.dart';
import 'package:jaka_user/pages/home/all_product.dart';
import 'package:jaka_user/pages/home/all_merchant.dart';
import 'package:jaka_user/pages/home/widget/merchant_list.dart';
import 'package:jaka_user/pages/home/widget/product_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<MerchantListState> _merchantListKey = GlobalKey();
  final GlobalKey<ProductListState> _productListKey = GlobalKey();
  final TextEditingController _searchController = TextEditingController();
  late String name = '';
  bool isRefreshing = false;

  @override
  void initState() {
    super.initState();
    loadUsername();
  }

  Future<void> loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userDataJson = prefs.getString('userData');
    if (userDataJson != null) {
      final userData = json.decode(userDataJson);
      setState(() {
        name = userData['user']['name'];
      });
    }
  }

  Future<void> _refresh() async {
    if (!mounted) return;
    setState(() {
      isRefreshing = true;
    });

    await _merchantListKey.currentState?.refresh();
    await _productListKey.currentState?.refresh();
    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) return;
    setState(() {
      isRefreshing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        toolbarHeight: 74.h,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(top: 12.h),
          child: CustomTextWidget(
            controller: _searchController,
            keyboardType: TextInputType.text,
            hintText: "Search for Foods...",
            suffixIcon: GestureDetector(
              onTap: () {},
              child: Icon(
                CupertinoIcons.search_circle_fill,
                size: 40.h,
                color: AppColors.primary,
              ),
            ),
            cursorColor: AppColors.black,
          ),
        ),
      ),
      body: RefreshIndicator(
        edgeOffset: 0,
        color: AppColors.primary,
        onRefresh: _refresh,
        child: ListView(
          children: [
            SafeArea(
              child: CustomContainer(
                color: AppColors.white,
                containerContent: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Heading(
                      text: "Merchant",
                      onTap: () {
                        Get.to(
                          () => const AllMerchant(),
                          transition: Transition.cupertino,
                          duration: const Duration(
                            milliseconds: 900,
                          ),
                        );
                      },
                    ),
                    MerchantList(
                      key: _merchantListKey,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Heading(
                      text: "Food",
                      onTap: () {
                        Get.to(
                          () => const AllProduct(),
                          transition: Transition.cupertino,
                          duration: const Duration(
                            milliseconds: 900,
                          ),
                        );
                      },
                    ),
                    ProductList(
                      key: _productListKey,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
