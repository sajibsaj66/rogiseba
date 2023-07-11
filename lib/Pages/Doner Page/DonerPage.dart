// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Pages/Doner%20Page/Widgets/BloodGroupSelector.dart';
import 'package:rogisheba/Pages/Doner%20Page/Widgets/DistrictSelector.dart';
import 'package:rogisheba/Pages/Doner%20Page/Widgets/DivisionSelector.dart';
import 'package:rogisheba/Pages/Doner%20Page/Widgets/DonorTop.dart';
import 'package:rogisheba/Pages/Doner%20Page/Widgets/ThanaSelector.dart';
import 'package:rogisheba/Providers/AddDonatorProvider.dart';

import 'Widgets/BloodOrgSelector.dart';

// starting of donor page.
class DonerPage extends StatefulWidget {
  const DonerPage({super.key});

  @override
  State<DonerPage> createState() => _DonerPageState();
}

class _DonerPageState extends State<DonerPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<AddDonatorProvider>(context, listen: false);
    provider.getAllBloodGroup(context);
    provider.getAllDonationGroup(context);
    provider.getAllDivision(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddDonatorProvider>(
      builder: (context, value, child) {
        return SafeArea(
          child: value.isLoading || value.isLoading2 || value.isLoading3
              ? const Scaffold(
                  backgroundColor: Colors.white,
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Scaffold(
                  backgroundColor: const Color(0xffFFFFFF),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 10.h),
                        // this widget is for top view of donor page.
                        const DonorTop(),
                        // this is the rest of donor page.
                        SizedBox(height: 11.5.h),
                        customText("আপনার নাম লিখুন"),
                        SizedBox(height: 5.h),
                        customTField("আপনার পূর্ণনাম লিখুন", nameController),
                        SizedBox(height: 21.h),
                        customText("আপনার মোবাইল নম্বর দিন"),
                        SizedBox(height: 5.h),
                        customTField("+880 xxxxxxxxxxx", phoneController),
                        SizedBox(height: 21.h),
                        rowSelector(
                          "ব্লাড গ্রুপ নির্বাচন করুন",
                          "ব্লাড গ্রুপ বেছে নিন",
                          "সংগঠন নির্বাচন করুন",
                          "সংগঠন বেছে নিন",
                        ),
                        SizedBox(height: 21.h),
                        customText("বিভাগ নির্বাচন করুন"),
                        SizedBox(height: 5.h),
                        const DivisionSelector(),
                        SizedBox(height: 21.h),
                        customText("জেলা নির্বাচন করুন"),
                        SizedBox(height: 5.h),
                        value.isLoading4
                            ? customTField2("জেলা বেছে নিন")
                            : const DistrictSelector(),
                        SizedBox(height: 21.h),
                        customText("থানা নির্বাচন করুন"),
                        SizedBox(height: 5.h),
                        value.isLoading5
                            ? customTField2("থানা বেছে নিন")
                            : const ThanaSelector(),
                        SizedBox(height: 30.h),
                        GestureDetector(
                          child: sendButton(),
                        )
                      ],
                    ),
                  ),
                ),
        );
      },
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

  Widget customTField(String title, TextEditingController controller) {
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
        controller: controller,
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
            bottom: 11.h,
          ),
        ),
      ),
    );
  }

  Widget rowSelector(
    String title1,
    String hint1,
    String title2,
    String hint2,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title1,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontFamily: 'custom',
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff343434),
                ),
              ),
              SizedBox(height: 5.h),
              Container(
                height: 36.h,
                width: 144.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(
                    color: const Color(0xffABABAB),
                    width: 1.w,
                  ),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: BloodGroupSelector(),
                    ),
                    Container(
                      height: 35.56.h,
                      width: 35.w,
                      alignment: Alignment.center,
                      color: const Color(0xffABABAB),
                      child: Icon(
                        Icons.arrow_drop_down,
                        size: 17.sp,
                        color: const Color(0xff343434),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title2,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontFamily: 'custom',
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff343434),
                ),
              ),
              SizedBox(height: 5.h),
              Container(
                height: 36.h,
                width: 159.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(
                    color: const Color(0xffABABAB),
                    width: 1.w,
                  ),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: BloodOrgSelector(),
                    ),
                    Container(
                      height: 35.56.h,
                      width: 35.w,
                      alignment: Alignment.center,
                      color: const Color(0xffABABAB),
                      child: Icon(
                        Icons.arrow_drop_down,
                        size: 17.sp,
                        color: const Color(0xff343434),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget customTField2(String title) {
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
            color: const Color(0xffABABAB),
            child: Icon(
              Icons.arrow_drop_down,
              size: 17.sp,
              color: const Color(0xff343434),
            ),
          ),
        ],
      ),
    );
  }

  Widget sendButton() {
    return Padding(
      padding: EdgeInsets.only(right: 20.w),
      child: Consumer<AddDonatorProvider>(
        builder: (context, value, child) {
          return GestureDetector(
            onTap: () {
              value.addingDonator(
                nameController.text,
                phoneController.text,
                context,
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
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
                  child: value.isDonator
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text(
                          "পাঠিয়ে দিন",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'custom',
                            fontWeight: FontWeight.w600,
                            color: const Color(0xffFFFFFF),
                          ),
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
