// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Providers/HomeDrawerProvider.dart';

// starting of save location widget.
class SaveLocation extends StatelessWidget {
  const SaveLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 333.h,
      width: double.infinity,
      margin: EdgeInsets.only(right: 27.w),
      decoration: BoxDecoration(
        color: const Color(0xffFFF2F2),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(8.r),
        ),
      ),
      child: Consumer<HomeDrawerProvider>(
        builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  value.showLocation();
                },
                child: locationTag(),
              ),
              SizedBox(height: 19.h),
              selectOptions("বিভাগ নির্বাচন করুন", "বিভাগ বেছে নিন"),
              SizedBox(height: 18.h),
              selectOptions("জেলা নির্বাচন করুন", "জেলা বেছে নিন"),
              SizedBox(height: 18.h),
              selectOptions("থানা নির্বাচন করুন", "থানা বেছে নিন"),
              SizedBox(height: 25.h),
              GestureDetector(
                onTap: () {
                  debugPrint("Send Button");
                },
                child: sendButton(),
              )
            ],
          );
        },
      ),
    );
  }

  Widget locationTag() {
    return Container(
      height: 40.h,
      padding: EdgeInsets.only(left: 40.w),
      decoration: BoxDecoration(
          color: const Color(0xffFFDBDD),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(8.r),
          )),
      child: Row(
        children: [
          Image.asset(
            "assets/images/location_icon.png",
            height: 15.h,
            width: 11.17.w,
            fit: BoxFit.fill,
          ),
          SizedBox(width: 20.w),
          Text(
            "স্থান",
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: 'custom',
              fontWeight: FontWeight.w400,
              color: const Color(0xff000000),
            ),
          ),
          SizedBox(width: 6.w),
          Icon(
            Icons.arrow_drop_down,
            size: 15.sp,
            color: const Color(0xff000000),
          )
        ],
      ),
    );
  }

  Widget selectOptions(String title, String selectTitle) {
    return Padding(
      padding: EdgeInsets.only(left: 41.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12.sp,
              fontFamily: 'custom',
              fontWeight: FontWeight.w400,
              color: const Color(0xff343434),
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          Container(
            height: 30.h,
            width: 188.w,
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 11.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(
                color: const Color(0xffF0787E),
                width: 1.w,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectTitle,
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontFamily: 'custom',
                    fontWeight: FontWeight.w300,
                    color: const Color(0xff343434),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 30.h,
                  width: 28.92.w,
                  decoration: const BoxDecoration(
                    color: Color(0xffF0787E),
                  ),
                  child: Icon(
                    Icons.arrow_drop_down,
                    size: 15.sp,
                    color: const Color(0xff343434),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget sendButton() {
    return Container(
      height: 33.h,
      width: 58.w,
      margin: EdgeInsets.only(left: 41.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xffE51C26),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Text(
        "সেভ",
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
