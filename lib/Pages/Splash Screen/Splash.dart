// ignore_for_file: file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Pages/Auth%20Screen/AuthPage.dart';
import 'package:rogisheba/Providers/ProfileProvider.dart';
import 'package:rogisheba/Utils/BottomBar.dart';

// this is Starting of Splash Screen
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // setting background color of whole Splash Screen
        backgroundColor: const Color(0xffFFFFFF),
        // using column for showing splash content.
        body: Column(
          children: [
            // using Sized box of top spacing
            SizedBox(
              height: 200.h,
            ),
            // Splash Screen Logo
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/splash_logo.jpg",
                  width: 124.w,
                  height: 200.h,
                  fit: BoxFit.fill,
                ),
              ],
            ),
            // using sizedbox for create space between splash logo and get started button.
            SizedBox(height: 243.h),
            // get started Button and it will go login page after clicking.
            Consumer<ProfileProvider>(
              builder: (context, value, child) {
                return GestureDetector(
                  onTap: () async {
                    bool result =
                        await InternetConnectionChecker().hasConnection;
                    if (result == false) {
                      BottomBar bottomBar = BottomBar();
                      bottomBar.showSnackBarRed(
                          context, "No Internet Connection Available");
                    } else {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                        builder: (context) {
                          return const AuthPage();
                        },
                      ), (route) => false);
                    }
                  },
                  child: customButton(),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget customButton() {
    return Container(
      // using alignment for centuring all child of button container.
      alignment: Alignment.center,
      padding: EdgeInsets.only(
        left: 33.w,
      ),
      height: 37.h,
      width: 171.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.5.r),
        color: const Color(0xffE51C26),
        // using light boxshadow for better visibility.
        boxShadow: [
          BoxShadow(
            color: const Color(0xff000000).withOpacity(.25),
            offset: const Offset(0, 1),
            spreadRadius: 0,
            blurRadius: 4,
          )
        ],
      ),
      // using this row for buttun content
      child: Row(
        children: [
          // using custom font
          Text(
            "Get started",
            style: TextStyle(
              fontSize: 15.sp,
              fontFamily: 'custom',
              fontWeight: FontWeight.w700,
              color: const Color(0xffFFFFFF),
            ),
          ),
          // using sizedbox for create space betwwen text and icon
          SizedBox(width: 10.w),
          Image.asset(
            "assets/images/arrow.png",
            height: 13.75.h,
            width: 21.50.w,
            fit: BoxFit.fill,
          )
        ],
      ),
    );
  }
}
