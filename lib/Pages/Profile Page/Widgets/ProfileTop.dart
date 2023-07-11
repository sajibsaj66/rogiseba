// ignore_for_file: file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rogisheba/Pages/Auth%20Screen/AuthPage.dart';
import 'package:rogisheba/Pages/HomePage/HomeRoot.dart';
import 'package:rogisheba/Utils/BottomBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileTop extends StatelessWidget {
  const ProfileTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 22.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                        builder: (context) {
                          return const HomeRoot();
                        },
                      ), (route) => false);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 20.sp,
                      color: const Color(0xff343434),
                    ),
                  ),
                  SizedBox(
                    width: 14.5.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "প্রোফাইল",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: 'custom',
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff343434),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        "ID : 24157",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'custom',
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff343434),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              GestureDetector(
                onTap: () {
                  logOut(context);
                },
                child: Container(
                  height: 30.h,
                  width: 94.82.w,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 13.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color: const Color(0xff0D99FF),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "লগআউট",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'custom',
                          fontWeight: FontWeight.w600,
                          color: const Color(0xffFFFFFF),
                        ),
                      ),
                      SizedBox(
                        width: 2.50.w,
                      ),
                      Icon(
                        Icons.exit_to_app,
                        size: 12.sp,
                        color: const Color(0xffFFFFFF),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Container(
          height: 0.5.h,
          width: double.infinity,
          margin: EdgeInsets.symmetric(
            horizontal: 21.w,
          ),
          color: const Color(0xff343434),
        )
      ],
    );
  }

  void logOut(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('user', 0);
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) {
        return const AuthPage();
      },
    ), (route) => false);
    BottomBar bottomBar = BottomBar();
    bottomBar.showSnackBarRed(context, "Logged Out Successfully");
  }
}