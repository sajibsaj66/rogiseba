// ignore_for_file: file_names,

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rogisheba/Pages/Point%20Page/Widgets/PointDetails.dart';
import 'package:rogisheba/Pages/Point%20Page/Widgets/PointPageTop.dart';
import 'package:rogisheba/Pages/Point%20Page/Widgets/WithdrawWay.dart';

// starting of point page widget
class PointPage extends StatelessWidget {
  const PointPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),

            // created point page top view related separate widget.
            const PointPageTop(),
            SizedBox(
              height: 21.h,
            ),
            // creating separte widget for point details
            const PointDetails(
              point: "১,০০০",
              taka: "১০.০০",
            ),
            SizedBox(
              height: 70.h,
            ),
            // creating separate widget for choose withdraw way.
            const WithdrawWay(),
            SizedBox(height: 19.h),
            // calling method for custom number field
            accountNumberField(),
            SizedBox(height: 23.h),
            // creating custom button for redem points
            GestureDetector(
              onTap: () {},
              child: redemButton(),
            )
          ],
        ),
      ),
    );
  }

  Widget accountNumberField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "একাউন্ট নাম্বার",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'custom',
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff343434),
                ),
              ),
              SizedBox(height: 14.h),
              Container(
                height: 36.h,
                width: 319.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(
                    color: const Color(0xffABABAB),
                    width: 1.w,
                  ),
                ),
                child: TextField(
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: 'custom',
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff343434),
                  ),
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 15.w, bottom: 12.h),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget redemButton() {
    return Container(
      height: 41.h,
      width: 143.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        color: const Color(0xff0B9444),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff000000).withOpacity(0.25),
            offset: const Offset(0, 0),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Text(
        "রিডিম",
        style: TextStyle(
          fontSize: 14.sp,
          fontFamily: 'custom',
          fontWeight: FontWeight.w600,
          color: const Color(0xffFFFFFF),
        ),
      ),
    );
  }
}
