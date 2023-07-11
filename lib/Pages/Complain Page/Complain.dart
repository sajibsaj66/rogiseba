// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Pages/Complain%20Page/Widgets/ComplainTop.dart';
import 'package:rogisheba/Providers/ComplainProvider.dart';

// starting of complain page.
class Complain extends StatelessWidget {
  const Complain({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              // this is for Top view of Complain Page.
              const ComplainTop(),
              SizedBox(
                height: 16.5.h,
              ),
              hideName(),
              // custom text method for Selection Title.
              customText("আপনার নাম লিখুন"),
              SizedBox(height: 5.h),
              // Custom Field Method for input.
              customTField("আপনার পূর্ণনাম লিখুন", nameController),
              SizedBox(height: 16.h),
              // custom text method for Selection Title.
              customText("আপনার অভিযোগ লিখুন"),
              SizedBox(height: 5.h),
              // Custom Field Method for input.
              customTField2(
                "এখানে আপনার অভিযোগ বিস্তারিত লিখুন ..",
                descriptionController,
              ),
              SizedBox(height: 32.h),
              // this is for sending complain.
              sendButton(nameController, descriptionController)
            ],
          ),
        ),
      ),
    );
  }

  Widget hideName() {
    return Consumer<ComplainProvider>(
      builder: (context, value, child) {
        return Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Checkbox(
                value: value.isHide,
                onChanged: (val) {
                  value.changeOption();
                },
              ),
              SizedBox(width: 8.w),
              Text(
                "পরিচয় গোপন রাখুন",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'custom',
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff343434),
                ),
              ),
            ],
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
            bottom: 10.h,
          ),
        ),
      ),
    );
  }

  Widget customTField2(String title, TextEditingController controller) {
    return Container(
      height: 417.h.h,
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
        maxLength: 450,
        maxLines: 20,
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
            top: 9.h,
          ),
        ),
      ),
    );
  }

  Widget sendButton(TextEditingController name, TextEditingController messege) {
    return Consumer<ComplainProvider>(
      builder: (context, value, child) {
        return GestureDetector(
          onTap: () {
            value.postComplain(name.text, messege.text, context);
          },
          child: Container(
            height: 41.h,
            width: 143.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              color: const Color(0xff000000),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff000000).withOpacity(0.25),
                  offset: const Offset(0, 0),
                  blurRadius: 4,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: value.isComplain
                ? SizedBox(
                    height: 20.h,
                    width: 20.h,
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
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
        );
      },
    );
  }
}
