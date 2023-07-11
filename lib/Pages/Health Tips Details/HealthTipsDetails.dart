// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rogisheba/Pages/Health%20Tips%20Details/Widgets/HealthTipsDetailsTop.dart';

import '../../Models/HealthTipsModel.dart';

class HealthTipsDetails extends StatelessWidget {
  final HealthTipsModel healthTips;
  final int index;
  const HealthTipsDetails({
    super.key,
    required this.healthTips,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: Column(
          children: [
            HealthTipsDetailsTop(
              title: healthTips.data![index].healthTipsHeading.toString(),
              doctorName: healthTips.data![index].healthTipsAuthor.toString(),
            ),
            SizedBox(height: 17.h),
            customText(healthTips.data![index].healthTipsDes.toString())
          ],
        ),
      ),
    );
  }

  Widget customText(String desc) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 21.w),
      child: Text(
        desc,
        style: TextStyle(
          fontSize: 14.sp,
          fontFamily: 'custom',
          fontWeight: FontWeight.w300,
          color: const Color(0xff000000),
        ),
      ),
    );
  }
}
