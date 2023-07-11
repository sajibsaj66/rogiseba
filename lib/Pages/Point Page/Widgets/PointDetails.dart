// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PointDetails extends StatelessWidget {
  final String point;
  final String taka;
  const PointDetails({super.key, required this.point, required this.taka});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "আপনার পয়েন্ট",
          style: TextStyle(
            fontSize: 16.sp,
            fontFamily: 'custom',
            fontWeight: FontWeight.w400,
            color: const Color(0xff343434),
          ),
        ),
        SizedBox(
          height: 9.h,
        ),
        Text(
          point,
          style: TextStyle(
            fontSize: 36.sp,
            fontFamily: 'custom',
            fontWeight: FontWeight.w400,
            color: const Color(0xff0B9444),
          ),
        ),
        SizedBox(
          height: 6.h,
        ),
        Text(
          "(  ৳  $taka )",
          style: TextStyle(
            fontSize: 15.sp,
            fontFamily: 'custom',
            fontWeight: FontWeight.w400,
            color: const Color(0xffABABAB),
          ),
        ),
      ],
    );
  }
}
