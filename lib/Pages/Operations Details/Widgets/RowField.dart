// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowField extends StatelessWidget {
  final String title1;
  final String title2;
  final String title3;
  const RowField({
    super.key,
    required this.title1,
    required this.title2,
    required this.title3,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title1,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontFamily: 'custom',
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff343434),
                ),
              ),
              SizedBox(height: 5.h),
              Container(
                height: 36.h,
                width: 89.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(
                    color: const Color(0xffABABAB),
                    width: 1.w,
                  ),
                ),
                child: TextField(
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'custom',
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff343434),
                  ),
                  decoration: const InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title2,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontFamily: 'custom',
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff343434),
                ),
              ),
              SizedBox(height: 5.h),
              Container(
                height: 36.h,
                width: 89.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(
                    color: const Color(0xffABABAB),
                    width: 1.w,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'custom',
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff343434),
                        ),
                        decoration: const InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      height: 36.h,
                      width: 22.w,
                      alignment: Alignment.center,
                      color: const Color(0xff343434),
                      child: Icon(
                        Icons.arrow_drop_down,
                        size: 17.sp,
                        color: const Color(0xffFFFFFF),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title2,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontFamily: 'custom',
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff343434),
                ),
              ),
              SizedBox(height: 5.h),
              Container(
                height: 36.h,
                width: 89.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(
                    color: const Color(0xffABABAB),
                    width: 1.w,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'custom',
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff343434),
                        ),
                        decoration: const InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      height: 36.h,
                      width: 22.w,
                      alignment: Alignment.center,
                      color: const Color(0xff343434),
                      child: Icon(
                        Icons.arrow_drop_down,
                        size: 17.sp,
                        color: const Color(0xffFFFFFF),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
