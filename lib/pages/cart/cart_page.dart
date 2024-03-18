import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jaka_user/common/appstyle.dart';
import 'package:jaka_user/constants/constants.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool isRefreshing = false;

  Future<void> _refresh() async {
    if (!mounted) return;
    setState(() {
      isRefreshing = true;
    });

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
        title: Text(
          'Cart',
          style: appstyle(22, AppColors.black, FontWeight.bold),
        ),
      ),
      body: RefreshIndicator(
        edgeOffset: 0,
        color: AppColors.primary,
        onRefresh: _refresh,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.h),
              child: const Column(
                children: [],
              ),
            )
          ],
        ),
      ),
    );
  }
}
