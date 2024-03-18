import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jaka_user/common/appstyle.dart';
import 'package:lottie/lottie.dart';

class OnBoardingScreen1 extends StatelessWidget {
  const OnBoardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.12,
            horizontal: 30.h),
        child: Column(
          children: [
            DotLottieLoader.fromAsset('assets/boardingscreen1.lottie',
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
              'Gausah Kemana-mana!',
              style: appstyle(20, Colors.black, FontWeight.bold),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              'Dengan layanan pengiriman Jaka, Anda tak perlu repot pergi ke kantin. Hemat waktu untuk tetap di gedung perkuliahan!',
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
