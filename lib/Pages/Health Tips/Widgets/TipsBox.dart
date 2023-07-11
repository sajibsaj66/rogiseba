// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rogisheba/Models/HealthTipsModel.dart';
import 'package:rogisheba/Pages/Health%20Tips%20Details/HealthTipsDetails.dart';

class TipsBox extends StatelessWidget {
  final HealthTipsModel healthTips;
  final int index;
  const TipsBox({super.key, required this.healthTips, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return HealthTipsDetails(healthTips: healthTips, index: index);
            },
          ),
        );
      },
      child: Container(
        height: 171.h,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff000000).withOpacity(0.25),
              offset: const Offset(0, 1),
              spreadRadius: 0,
              blurRadius: 4,
            )
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 114.h,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xffD9D9D9),
                image: DecorationImage(
                  image: NetworkImage(
                    healthTips.data![index].healthTipsImageUrl.toString(),
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              height: 57.h,
              width: double.infinity,
              padding: EdgeInsets.only(left: 10.w, top: 9.h),
              decoration: const BoxDecoration(
                color: Color(0xffFFFFFF),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    healthTips.data![index].healthTipsHeading.toString(),
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: 'custom',
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff343434),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    healthTips.data![index].healthTipsAuthor.toString(),
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: 'custom',
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffABABAB),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
