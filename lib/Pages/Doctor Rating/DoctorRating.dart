// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Pages/Doctor%20Rating/Widgets/DoctorRatingDoctorSelector.dart';
import 'package:rogisheba/Pages/Doctor%20Rating/Widgets/DoctorRatingTop.dart';
import 'package:rogisheba/Providers/DoctorProvider.dart';
import 'package:rogisheba/Providers/HospitalProvider.dart';

import 'Widgets/DoctorRatingHospitalSelector.dart';

// starting of Doctor Page.
class DoctorRating extends StatefulWidget {
  const DoctorRating({super.key});

  @override
  State<DoctorRating> createState() => _DoctorRatingState();
}

class _DoctorRatingState extends State<DoctorRating> {
  double rating = 0.0;
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<HospitalProvider>(context, listen: false);
    provider.getAllHospital(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HospitalProvider>(
      builder: (context, value, child) {
        return SafeArea(
          child: value.isLoading
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
                        SizedBox(
                          height: 10.h,
                        ),
                        // this is for Top view of Doctor Rating Page.
                        const DoctorRatingTop(),
                        SizedBox(
                          height: 11.h,
                        ),
                        // custom text method for Selection Title.
                        customText("হাসপাতালের নাম"),
                        SizedBox(height: 5.h),
                        // Custom Field Method for input choice.
                        const DoctorRagingHospitalSelector(),
                        SizedBox(height: 20.h),
                        // custom text method for Selection Title.
                        customText("ডাক্তারের নাম"),
                        SizedBox(height: 5.h),
                        // Custom Field Method for input choice.
                        value.isLoading3
                            ? customTField("ডাক্তারের নাম বাছাই করুন")
                            : const DoctorRatingDoctorSelector(),
                        SizedBox(height: 20.h),
                        // custom text method for Selection Title.
                        customText("রেটিং দিন"),
                        SizedBox(
                          height: 10.h,
                        ),
                        // this method is for giving ratings.
                        ratings(),
                        SizedBox(
                          height: 53.h,
                        ),
                        // this is for sending review of doctor.
                        sendButton()
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

  Widget ratings() {
    return RatingBar.builder(
      itemSize: 38.62.sp,
      initialRating: 0,
      minRating: 0,
      direction: Axis.horizontal,
      allowHalfRating: false,
      itemCount: 5,
      itemPadding: EdgeInsets.only(right: 19.31.w),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rat) {
        setState(() {
          rating = rat;
        });
      },
    );
  }

  Widget sendButton() {
    return Consumer<DoctorProvider>(
      builder: (context, value, child) {
        return GestureDetector(
          onTap: () {
            value.addDoctorRating(rating, context);
          },
          child: Container(
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
            child: value.isRating
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
        );
      },
    );
  }
}
