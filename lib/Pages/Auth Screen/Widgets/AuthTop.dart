// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Providers/AuthProvider.dart';


// creating authentication top widget.
class AuthTop extends StatelessWidget {
  const AuthTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 14.w,
          ),
          height: 352.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xffFFDBDD),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8.r),
              bottomRight: Radius.circular(8.r),
            ),
          ),
        ),
        Positioned(
          top: 90.h,
          right: 0,
          left: 0,
          child: centerLogo(),
        ),
        Positioned(
          top: 329.h,
          right: 0,
          left: 0,
          child: buttons(),
        ),
      ],
    );
  }

  Widget centerLogo() {
    return Container(
      height: 170.h,
      width: 170.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xffFFFFFF).withOpacity(0.38),
      ),
      padding: const EdgeInsets.all(8),
      child: Container(
        alignment: Alignment.center,
        height: 154.h,
        width: 154.w,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xffFFFFFF),
        ),
        child: Image.asset(
          "assets/images/splash_logo.jpg",
          height: 115.91.h,
          width: 71.85.w,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget buttons() {
    return Consumer<AuthProvider>(builder: (context, value, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              value.checkLogin(true);
            },
            child: Container(
              alignment: Alignment.center,
              width: 110.w,
              height: 37.h,
              decoration: BoxDecoration(
                color: value.isLogin
                    ? const Color(0xffE51C26)
                    : const Color(0xffFFFFFF),
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(20.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff000000).withOpacity(.25),
                    offset: const Offset(0, 1),
                    spreadRadius: 0,
                    blurRadius: 3,
                  )
                ],
              ),
              child: Text(
                "Log in",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: 'custom',
                  fontWeight: FontWeight.w700,
                  color: value.isLogin
                      ? const Color(0xffFFFFFF)
                      : const Color(0xffE51C26),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              value.checkLogin(false);
            },
            child: Container(
              alignment: Alignment.center,
              width: 110.w,
              height: 37.h,
              decoration: BoxDecoration(
                color: value.isLogin
                    ? const Color(0xffFFFFFF)
                    : const Color(0xffE51C26),
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(20.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff000000).withOpacity(.25),
                    offset: const Offset(0, 1),
                    spreadRadius: 0,
                    blurRadius: 3,
                  )
                ],
              ),
              child: Text(
                "Register",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: 'custom',
                  fontWeight: FontWeight.w700,
                  color: value.isLogin
                      ? const Color(0xffE51C26)
                      : const Color(0xffFFFFFF),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
