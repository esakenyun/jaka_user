import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jaka_user/common/appstyle.dart';
import 'package:jaka_user/constants/constants.dart';
import 'package:jaka_user/pages/auth/signin_page.dart';
import 'package:jaka_user/pages/onboarding/onboarding_screen1.dart';
import 'package:jaka_user/pages/onboarding/onboarding_screen2.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
            children: const [
              OnBoardingScreen1(),
              OnBoardingScreen2(),
            ],
          ),

          // Dot Indicator
          Positioned(
            bottom: MediaQuery.of(context).viewInsets.bottom + 10.h,
            left: 0,
            right: 0,
            child: Container(
              alignment: const Alignment(0, 0.75),
              child: SmoothPageIndicator(
                controller: _controller,
                count: 2,
                effect: WormEffect(
                  activeDotColor: Colors.blue,
                  dotWidth: 10.h,
                  dotHeight: 10.h,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 20.h),
        child: ElevatedButton(
          onPressed: () {
            if (_currentPageIndex == 0) {
              _controller.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            } else {
              Get.off(
                () => const SignInPage(),
                transition: Transition.size,
                duration: const Duration(milliseconds: 1000),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            textStyle: appstyle(15, Colors.white, FontWeight.bold),
            backgroundColor: AppColors.primary,
          ),
          child: Text(
            _currentPageIndex == 0 ? 'Continue' : 'Getting Started',
            style: appstyle(16, Colors.white, FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
