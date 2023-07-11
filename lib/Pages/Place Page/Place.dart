// ignore_for_file: file_names,

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Pages/Place%20Page/Widgets/PlaceDistrict.dart';
import 'package:rogisheba/Pages/Place%20Page/Widgets/PlaceDivision.dart';
import 'package:rogisheba/Pages/Place%20Page/Widgets/PlaceThana.dart';
import 'package:rogisheba/Pages/Place%20Page/Widgets/PlaceTop.dart';
import 'package:rogisheba/Utils/BottomBar.dart';

import '../../Providers/AddDonatorProvider.dart';

class Place extends StatefulWidget {
  const Place({super.key});

  @override
  State<Place> createState() => _PlaceState();
}

class _PlaceState extends State<Place> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<AddDonatorProvider>(context, listen: false);
    provider.getAllDivision(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddDonatorProvider>(
      builder: (context, value, child) {
        return SafeArea(
          child: value.isLoading3
              ? const Scaffold(
                  backgroundColor: Colors.white,
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Scaffold(
                  backgroundColor: const Color(0xffFFFFFF),
                  body: Column(
                    children: [
                      SizedBox(height: 10.h),
                      // top of place page.
                      const PlaceTop(),
                      SizedBox(height: 26.5.h),
                      // rest of the place page.
                      customText("বিভাগ নির্বাচন করুন"),
                      SizedBox(height: 5.h),
                      const PlaceDivision(),
                      SizedBox(height: 22.h),
                      customText("জেলা নির্বাচন করুন"),
                      SizedBox(height: 5.h),
                      value.isLoading4
                          ? customTField("জেলা বেছে নিন")
                          : const PlaceDistrict(),
                      SizedBox(height: 22.h),
                      customText("থানা নির্বাচন করুন"),
                      SizedBox(height: 5.h),
                      value.isLoading5
                          ? customTField("থানা বেছে নিন")
                          : const PlaceThana(),
                      SizedBox(height: 41.h),
                      GestureDetector(
                        onTap: () {
                          if (value.hint3 == "বিভাগ বেছে নিন" ||
                              value.hint4 == "জেলা বেছে নিন" ||
                              value.hint5 == "থানা বেছে নিন") {
                            BottomBar bottomBar = BottomBar();
                            bottomBar.showSnackBarRed(
                                context, "Every field needs to fill");
                          } else {}
                        },
                        child: customButton(),
                      )
                    ],
                  ),
                ),
        );
      },
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
          color: const Color(0xffF0787E),
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
            color: const Color(0xffF0787E),
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

  Widget customButton() {
    return Consumer<AddDonatorProvider>(
      builder: (context, value, child) {
        return Container(
          height: 40.h,
          width: 52.62.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.r),
            color: const Color(0xffE51C26),
          ),
          child: Image.asset(
            "assets/images/arrow.png",
            height: 18.33.h,
            width: 28.07.w,
            fit: BoxFit.fill,
          ),
        );
      },
    );
  }
}
