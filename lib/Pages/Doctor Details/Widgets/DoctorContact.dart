// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorContact extends StatelessWidget {
  const DoctorContact({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 67.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 29.w,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xffFFFFFF),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff000000).withOpacity(0.25),
            offset: const Offset(0, -1),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 34.h,
            width: 178.w,
            padding: EdgeInsets.only(
              left: 36.w,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              color: const Color(0xffE51C26),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff000000).withOpacity(0.25),
                  offset: const Offset(0, 2),
                  blurRadius: 4,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/appointment_logo.png",
                  height: 20.h,
                  width: 16.92.w,
                ),
                SizedBox(
                  width: 13.08.w,
                ),
                Text(
                  "অ্যাপয়েন্টমেন্ট",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'custom',
                    fontWeight: FontWeight.w600,
                    color: const Color(0xffFFFFFF),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 34.h,
            width: 114.w,
            padding: EdgeInsets.only(
              left: 37.w,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              color: const Color(0xff0B9444),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff000000).withOpacity(0.25),
                  offset: const Offset(0, 2),
                  blurRadius: 4,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(
                  Icons.phone,
                  size: 15.sp,
                  color: const Color(0xffFFFFFF),
                ),
                SizedBox(
                  width: 7.82.w,
                ),
                Text(
                  "কল",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'custom',
                    fontWeight: FontWeight.w600,
                    color: const Color(0xffFFFFFF),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
