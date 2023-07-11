// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HospitalContact extends StatelessWidget {
  const HospitalContact({super.key});

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
            width: 140.w,
            padding: EdgeInsets.only(
              left: 24.w,
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
                Icon(
                  Icons.phone,
                  size: 15.sp,
                  color: const Color(0xffFFFFFF),
                ),
                SizedBox(
                  width: 7.82.w,
                ),
                Text(
                  "ইমার্জেন্সি কল",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'custom',
                    fontWeight: FontWeight.w400,
                    color: const Color(0xffFFFFFF),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 34.h,
            width: 147.w,
            padding: EdgeInsets.only(
              left: 16.w,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              color: const Color(0xffFFFFFF),
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
                  "assets/images/hospital_logo.png",
                  height: 20.h,
                  width: 26.34.w,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 7.82.w,
                ),
                Text(
                  "অ্যাম্বুলেন্স কল",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'custom',
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff000000),
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
