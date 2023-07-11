// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rogisheba/Pages/Operations%20Details/Widgets/OperationDetailsTop.dart';
import 'package:rogisheba/Pages/Operations%20Details/Widgets/OperationsDetailsBottom.dart';
import 'package:rogisheba/Pages/Operations%20Details/Widgets/RowField.dart';

class OperationsDetails extends StatelessWidget {
  final String operationName;
  final String hospitalName;
  const OperationsDetails(
      {super.key, required this.operationName, required this.hospitalName});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: SingleChildScrollView(
          child: Column(
            children: [
              OperationsDetailsTop(
                operationName: operationName,
                hospitalName: hospitalName,
              ),
              SizedBox(height: 26.h),
              customText("ডাক্তারের নাম"),
              SizedBox(height: 5.h),
              customTField("ডাক্তারের নাম বাছাই করুন"),
              SizedBox(height: 21.h),
              customText("রোগীর নাম"),
              SizedBox(height: 5.h),
              customTField2("রোগীর পূর্ণনাম লিখুন"),
              SizedBox(height: 21.h),
              const RowField(
                title1: "রোগীর বয়স",
                title2: "ব্লাড গ্রুপ",
                title3: "লিঙ্গ",
              ),
              SizedBox(height: 21.h),
              customText("রোগীর মোবাইল নাম্বার"),
              SizedBox(height: 5.h),
              customTField2(" +৮৮ ০১xxxxxxxxx"),
              SizedBox(height: 21.h),
              customText("অপারেশনের তারিখ"),
              SizedBox(height: 5.h),
              customTField3("dd / mm / yyyy"),
              SizedBox(height: 24.h),
              const OperationsDetailsBottom(),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget customText(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w),
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
      margin: EdgeInsets.symmetric(horizontal: 30.w),
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
              decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                hintText: title,
                hintStyle: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: 'custom',
                  fontWeight: FontWeight.w400,
                  color: const Color(0xffCACACA),
                ),
                contentPadding: EdgeInsets.only(
                  left: 18.w,
                  bottom: 10.h,
                ),
              ),
            ),
          ),
          Container(
            height: 35.56.h,
            width: 35.w,
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
    );
  }

  Widget customTField2(String title) {
    return Container(
      height: 36.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 30.w),
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
        decoration: InputDecoration(
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          hintText: title,
          hintStyle: TextStyle(
            fontSize: 12.sp,
            fontFamily: 'custom',
            fontWeight: FontWeight.w400,
            color: const Color(0xffCACACA),
          ),
          contentPadding: EdgeInsets.only(
            left: 18.w,
            bottom: 10.h,
          ),
        ),
      ),
    );
  }

  Widget customTField3(String title) {
    return Container(
      height: 36.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 30.w),
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
              decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                hintText: title,
                hintStyle: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: 'custom',
                  fontWeight: FontWeight.w400,
                  color: const Color(0xffCACACA),
                ),
                contentPadding: EdgeInsets.only(
                  left: 18.w,
                  bottom: 10.h,
                ),
              ),
            ),
          ),
          Container(
            height: 35.56.h,
            width: 35.w,
            alignment: Alignment.center,
            color: const Color(0xff343434),
            child: Icon(
              Icons.calendar_month,
              size: 19.sp,
              color: const Color(0xffFFFFFF),
            ),
          ),
        ],
      ),
    );
  }
}
