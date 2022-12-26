import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingSlider(
        controllerColor: Color(0xff002455),
        finishButtonColor: Color(0xff002455),
        headerBackgroundColor: Colors.white,
        finishButtonText: 'Mulai',
        skipFunctionOverride: () => Get.offAllNamed(Routes.MAIN_MENU),
        onFinish: () => Get.offAllNamed(Routes.MAIN_MENU),
        skipTextButton: Text(
          'Skip',
          style: TextStyle(
            color: Color(0xff002455),
          ),
        ),
        background: [
          Image.asset('assets/bg.jpg'),
          Image.asset('assets/bg.jpg'),
          Image.asset('assets/bg.jpg'),
        ],
        totalPage: 3,
        speed: 1.8,
        pageBodies: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                LottieBuilder.asset('assets/kaca.json'),
                Text(
                  'Find Bentos',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 50.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff002455),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Membantu menganalisis kualitas perairan berdasarkan keberadaan Bentos",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 16.sp,
                      color: Color(0xff002455),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30.h,
                ),
                LottieBuilder.asset('assets/hp.json'),
                SizedBox(
                  height: 100.h,
                ),
                Text(
                  'Easy To Use',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 50.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff002455),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Aplikasi berbasis mobile mempermudah proses analisis yang disertai dengan hasil Laporan temuan yang mudah diunduh",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 16.sp,
                      color: Color(0xff002455),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 80.h,
                ),
                LottieBuilder.asset('assets/online.json'),
                Text(
                  'Hybrid Learning',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff002455),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "Mengoptimalkan pembelajaran secara daring dan luring dimanapun dan kapanpun",
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 16.sp,
                      color: Color(0xff002455),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
