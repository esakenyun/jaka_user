import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:jaka_user/pages/entrypoint.dart';
import 'package:jaka_user/pages/onboarding/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 825),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Jaka',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.black),
            primarySwatch: Colors.blue,
          ),
          home: const SplashScreen(),
        );
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkToken();
  }

  Future<void> _checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userDataJson = prefs.getString('userData');
    if (userDataJson != null) {
      final userData = json.decode(userDataJson);
      final token = userData['token'];
      if (token != null) {
        Get.offAll(() => const EntryPoint());
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) =>
        //           const EntryPoint()), // Ganti dengan halaman entry point Anda
        // );
      } else {
        Get.offAll(() => const OnBoardingScreen());
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) =>
        //           const OnBoardingScreen()), // Ganti dengan halaman onboarding Anda
        // );
      }
    } else {
      Get.offAll(() => const OnBoardingScreen());
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //       builder: (context) =>
      //           const OnBoardingScreen()), // Ganti dengan halaman onboarding Anda
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child:
            CircularProgressIndicator(), // Atau widget lainnya sebagai indikator loading
      ),
    );
  }
}
