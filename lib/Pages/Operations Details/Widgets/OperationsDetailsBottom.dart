// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OperationsDetailsBottom extends StatelessWidget {
  const OperationsDetailsBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        children: [
          Container(
            height: 1.h,
            width: double.infinity,
            color: const Color(0xffCACACA),
          ),
          SizedBox(height: 15.5.h),
          customText("অপারেশনের ফি", "৫০০/="),
          SizedBox(height: 22.5.h),
          admitButton(),
        ],
      ),
    );
  }

  Widget customText(String title, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontFamily: 'custom',
            fontWeight: FontWeight.w600,
            color: const Color(0xff000000),
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            fontSize: 16.sp,
            fontFamily: 'custom',
            fontWeight: FontWeight.w600,
            color: const Color(0xff000000),
          ),
        )
      ],
    );
  }

  Widget admitButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 41.h,
          width: 178.w,
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
          child: Text(
            "ভর্তি হোন",
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: 'custom',
              fontWeight: FontWeight.w600,
              color: const Color(0xffFFFFFF),
            ),
          ),
        ),
        Container(
          height: 41.h,
          width: 109.w,
          padding: EdgeInsets.only(
            left: 35.w,
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
                color: const Color(0xffFFFFFF),
                size: 15.sp,
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
    );
  }
}
