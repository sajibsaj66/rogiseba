// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WithdrawWay extends StatelessWidget {
  const WithdrawWay({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "টাকা উত্তোলনের মাধ্যম",
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: 'custom',
              fontWeight: FontWeight.w400,
              color: const Color(0xff343434),
            ),
          ),
          Container(
            height: 36.h,
            width: 143.w,
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 16.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(
                color: const Color(0xffABABAB),
                width: 1.w,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "বিকাশ",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'custom',
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff343434),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Image.asset(
                      "assets/images/bkash_logo.png",
                      height: 18.w,
                      width: 19.07.w,
                      fit: BoxFit.cover,
                    )
                  ],
                ),
                GestureDetector(
                  child: Container(
                    height: 35.56.h,
                    width: 35.w,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Color(0xff343434),
                    ),
                    child: Icon(
                      Icons.arrow_drop_down,
                      size: 17.sp,
                      color: const Color(0xffFFFFFF),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
