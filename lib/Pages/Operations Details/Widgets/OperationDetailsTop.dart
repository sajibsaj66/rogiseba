// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OperationsDetailsTop extends StatelessWidget {
  final String operationName;
  final String hospitalName;
  const OperationsDetailsTop({
    super.key,
    required this.operationName,
    required this.hospitalName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 215.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xffFFDBDD),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            operationName,
            style: TextStyle(
              fontSize: 20.sp,
              fontFamily: 'custom',
              fontWeight: FontWeight.w700,
              color: const Color(0xff343434),
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            hospitalName,
            style: TextStyle(
              fontSize: 13.sp,
              fontFamily: 'custom',
              fontWeight: FontWeight.w400,
              color: const Color(0xff343434),
            ),
          ),
          SizedBox(height: 25.h),
        ],
      ),
    );
  }
}
