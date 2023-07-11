// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Providers/HospitalProvider.dart';

import 'Widgets/GoogleMapImage.dart';
import 'Widgets/HospitalContact.dart';
import 'Widgets/HospitalDetailsTop.dart';

class HospitalDetails extends StatelessWidget {
  final int hospitalID;
  const HospitalDetails({
    super.key,
    required this.hospitalID,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HospitalProvider>(context, listen: false);
    provider.getHospitalDetails(hospitalID.toString(), context);
    return Consumer<HospitalProvider>(
      builder: (context, value, child) {
        return SafeArea(
          child: value.isLoading2
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
                      Expanded(
                        child: ListView(
                          children: [
                            const HospitalDetailsTop(),
                            SizedBox(height: 36.h),
                            customtext(),
                            SizedBox(height: 33.h),
                            titleRow("বিভাগসমূহ", "আরো দেখুন >"),
                            SizedBox(height: 10.h),
                            options(),
                            SizedBox(height: 28.h),
                            titleRow("অপারেশনসমূহ", "আরো দেখুন >"),
                            SizedBox(height: 10.h),
                            options2(),
                            SizedBox(height: 28.h),
                            titleRow("ম্যাপে লোকেশন", "গুগল ম্যাপে যান >"),
                            SizedBox(height: 19.h),
                            const GoogleMapImage(),
                            SizedBox(height: 20.h),
                          ],
                        ),
                      ),
                      const HospitalContact(),
                    ],
                  ),
                ),
        );
      },
    );
  }

  Widget customtext() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 29.w),
      child: Consumer<HospitalProvider>(
        builder: (context, value, child) {
          return Text(
            value.hospitalDetails.hospitalInfo![0].hospitalInfo.toString(),
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: 'custom',
              fontWeight: FontWeight.w400,
              color: const Color(0xff343434),
            ),
          );
        },
      ),
    );
  }

  Widget titleRow(
    String title1,
    String title2,
  ) {
    return Padding(
      padding: EdgeInsets.only(
        left: 29.w,
        right: 26.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title1,
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: 'custom',
              fontWeight: FontWeight.w600,
              color: const Color(0xff343434),
            ),
          ),
          Text(
            title2,
            style: TextStyle(
              fontSize: 11.sp,
              fontStyle: FontStyle.italic,
              fontFamily: 'custom',
              fontWeight: FontWeight.w400,
              color: const Color(0xff0D99FF),
            ),
          )
        ],
      ),
    );
  }

  Widget options() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 29.w,
      ),
      child: Consumer<HospitalProvider>(
        builder: (context, value, child) {
          return SizedBox(
            width: double.infinity,
            height: 56.h,
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 20,
              ),
              children: List.generate(
                value.hospitalDetails.hospitalSectors!.length,
                (index) {
                  String text = value
                      .hospitalDetails.hospitalSectors![index].sectorName
                      .toString();
                  return Text(
                    text,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'custom',
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffE51C26),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget options2() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 29.w,
      ),
      child: Consumer<HospitalProvider>(
        builder: (context, value, child) {
          return SizedBox(
            width: double.infinity,
            height: 56.h,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 20,
              ),
              itemCount: value.hospitalDetails.hospitalOperations!.length,
              itemBuilder: (BuildContext context, int index) {
                String text = value
                    .hospitalDetails.hospitalOperations![index].operationName
                    .toString();
                return Text(
                  text,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'custom',
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff0B9444),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
