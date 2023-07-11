// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HealthTipsDetailsTop extends StatelessWidget {
  final String title;
  final String doctorName;
  const HealthTipsDetailsTop({
    super.key,
    required this.title,
    required this.doctorName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Color(0xffFFDBDD),
      ),
      child: Column(
        children: [
          SizedBox(height: 23.h),
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: const Color(0xff343434),
                    size: 22.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 11.h),
          details(title, doctorName)
        ],
      ),
    );
  }

  Widget details(String title, String doctorName) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'custom',
                fontWeight: FontWeight.w600,
                color: const Color(0xff343434),
              ),
            ),
            SizedBox(height: 7.h),
            Text(
              doctorName,
              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'custom',
                fontWeight: FontWeight.w300,
                color: const Color(0xff000000),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
