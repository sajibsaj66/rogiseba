// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rogisheba/Pages/Appointment%202/Appointment2.dart';
import 'package:rogisheba/Pages/Blood%20Bank/BloodBank.dart';
import 'package:rogisheba/Pages/Health%20Tips/HealthTips.dart';
import 'package:rogisheba/Pages/Operation%202/Operation2.dart';

// starting of home option widget.
class HomeOptions extends StatelessWidget {
  const HomeOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 21.w),
      padding: EdgeInsets.only(
        left: 24.w,
        top: 19.h,
        right: 24.w,
        bottom: 20.h,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xffCACACA),
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // it will navigate doctor appointment page after clicking.
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Appointment2();
                      },
                    ),
                  );
                },
                child: customOptions(
                  "assets/images/doctor_appointment.jpg",
                  "ডাক্তার এপয়েন্টমেন্ট",
                  true,
                ),
              ),
              SizedBox(width: 23.5.w),
              Container(
                height: 110.h,
                width: 1.5.w,
                color: const Color(0xffD9D9D9),
              ),
              SizedBox(width: 36.5.w),

              // it will navigate operation admit page after clicking.
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Operation2(
                          operationName: '',
                        );
                      },
                    ),
                  );
                },
                child: customOptions(
                  "assets/images/operation_admission.jpg",
                  "অপারেশন ও ভর্তি",
                  true,
                ),
              ),
            ],
          ),
          Container(
            width: 215.w,
            height: 1.5.h,
            color: const Color(0xffD9D9D9),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 20.w,
              ),

              // it will navigate blood bank page after clicking.
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const BloodBank();
                      },
                    ),
                  );
                },
                child: customOptions(
                  "assets/images/blood_bank.jpg",
                  "ব্লাড ব্যাংক",
                  false,
                ),
              ),
              SizedBox(width: 38.w),
              Container(
                height: 110.h,
                width: 1.5.w,
                color: const Color(0xffD9D9D9),
              ),
              SizedBox(width: 22.5.w),

              // it will navigate health tips page after clicking.
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const HealthTips();
                      },
                    ),
                  );
                },
                child: customOptions(
                  "assets/images/health_tips.jpg",
                  "স্বাস্থ্য বিষয়ক নির্দেশনা",
                  false,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget customOptions(String image, String title, bool isTop) {
    return Column(
      children: [
        isTop ? Container() : SizedBox(height: 15.h),
        Image.asset(
          image,
          height: 70.h,
          width: 68.w,
          fit: BoxFit.fill,
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontFamily: 'custom',
            fontWeight: FontWeight.w600,
            color: const Color(0xff343434),
          ),
        ),
        isTop
            ? SizedBox(
                height: 15.h,
              )
            : Container(),
      ],
    );
  }
}
