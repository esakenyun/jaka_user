import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jaka_user/common/appstyle.dart';
import 'package:lottie/lottie.dart';

class OnBoardingScreen2 extends StatelessWidget {
  const OnBoardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.12,
            horizontal: 30.h),
        child: Column(
          children: [
            DotLottieLoader.fromAsset('assets/boardingscreen2.lottie',
                frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
              if (dotlottie != null) {
                return Lottie.memory(
                  dotlottie.animations.values.single,
                );
              } else {
                return Container();
              }
            }),
            SizedBox(
              height: 5.h,
            ),
            Text(
              'Telusuri, Pesan, Nikmati!',
              style: appstyle(20, Colors.black, FontWeight.bold),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              'Dengan sekali sentuhan jari, akses beragam hidangan lezat dari ribuan restoran favoritmu. Mulai jelajahi sekarang dan temukan cita rasa baru!',
              style: appstyle(
                13,
                Colors.black,
                FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
