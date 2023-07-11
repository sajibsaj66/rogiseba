// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rogisheba/Pages/History%20Page/Widgets/HistoryDetailsTop.dart';

class HistoryDetails extends StatelessWidget {
  final String patientname;
  final String patientNumber;
  final String appointMentDate;
  final String hospitalName;
  final String doctorName;
  const HistoryDetails({
    super.key,
    required this.patientname,
    required this.patientNumber,
    required this.appointMentDate,
    required this.hospitalName,
    required this.doctorName,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              const HistoryDetailsTop(),
              SizedBox(height: 15.h),
              customText("Patient name"),
              SizedBox(height: 5.h),
              customTField(
                patientname,
              ),
              SizedBox(height: 16.h),
              customText("Patient Number"),
              SizedBox(height: 5.h),
              customTField(
                patientNumber,
              ),
              SizedBox(height: 16.h),
              customText("Appointment Date"),
              SizedBox(height: 5.h),
              customTField(
                appointMentDate,
              ),
              SizedBox(height: 16.h),
              customText("Hospital Name"),
              SizedBox(height: 5.h),
              customTField(
                hospitalName,
              ),
              SizedBox(height: 16.h),
              customText("Doctor name"),
              SizedBox(height: 5.h),
              customTField(
                doctorName,
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget customText(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 13.sp,
              fontFamily: 'custom',
              fontWeight: FontWeight.w400,
              color: const Color(0xff343434),
            ),
          )
        ],
      ),
    );
  }

  Widget customTField(String title) {
    return Container(
      height: 36.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(
          color: const Color(0xffABABAB),
          width: 1.w,
        ),
      ),
      child: TextField(
        readOnly: true,
        style: TextStyle(
          fontSize: 14.sp,
          fontFamily: 'custom',
          fontWeight: FontWeight.w600,
          color: const Color(0xff343434),
        ),
        decoration: InputDecoration(
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          hintText: title,
          hintStyle: TextStyle(
            fontSize: 12.sp,
            fontFamily: 'custom',
            fontWeight: FontWeight.w600,
            color: const Color(0xff343434),
          ),
          contentPadding: EdgeInsets.only(
            left: 18.w,
            bottom: 10.h,
          ),
        ),
      ),
    );
  }
}
