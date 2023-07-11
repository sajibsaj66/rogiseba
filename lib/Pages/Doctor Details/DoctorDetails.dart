// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Pages/Doctor%20Details/Widgets/DoctorContact.dart';
import 'package:rogisheba/Pages/Doctor%20Details/Widgets/DoctorDetailsTop.dart';
import 'package:rogisheba/Providers/DoctorProvider.dart';

class DoctorDetails extends StatelessWidget {
  final int doctorID;
  const DoctorDetails({super.key, required this.doctorID});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DoctorProvider>(context, listen: false);
    provider.getDoctorDetails(doctorID.toString(), context);
    return Consumer<DoctorProvider>(
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
                      Expanded(
                        child: ListView(
                          children: [
                            const DoctorDetailsTop(),
                            SizedBox(height: 36.h),
                            customtext(),
                            SizedBox(height: 33.h),
                            titleRow("বিশেষত্ব"),
                            SizedBox(height: 10.h),
                            options(),
                            SizedBox(height: 33.h),
                            titleRow("রোগী দেখার সময়"),
                            SizedBox(height: 10.h),
                            Column(
                              children: List.generate(
                                value.doctorDetails.doctorTime!.length,
                                (index) => Column(
                                  children: [
                                    customtext2(
                                        "চেম্বারঃ ${value.doctorDetails.doctorTime![index].hospitalName}"),
                                    SizedBox(height: 7.h),
                                    Padding(
                                      padding: EdgeInsets.only(left: 29.w),
                                      child: customtext3(value
                                          .doctorDetails.doctorTime![index].time
                                          .toString()),
                                    ),
                                    SizedBox(height: 5.h),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 33.h),
                            titleRow2(
                                "ফি - ${value.doctorDetails.doctorInfo![0].doctorFees.toString()}/="),
                            SizedBox(height: 33.h),
                            titleRow("ছুটির দিন"),
                            SizedBox(
                              height: 10.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 29.w),
                              child: Row(
                                children: List.generate(
                                  value.doctorDetails.doctorOffDay!.length,
                                  (index) => Row(
                                    children: [
                                      customtext3(
                                          "${value.doctorDetails.doctorOffDay![index].doctorOffDay}"),
                                      SizedBox(
                                        width: 5.w,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        ),
                      ),
                      const DoctorContact()
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
      child: Consumer<DoctorProvider>(
        builder: (context, value, child) {
          return Text(
            value.doctorDetails.doctorInfo![0].doctorInfo.toString(),
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

  Widget customtext2(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 29.w),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 13.sp,
              fontFamily: 'custom',
              fontWeight: FontWeight.w400,
              color: const Color(0xffF0787E),
            ),
          ),
        ],
      ),
    );
  }

  Widget customtext3(String title) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontFamily: 'custom',
            fontWeight: FontWeight.w400,
            color: const Color(0xff000000),
          ),
        ),
      ],
    );
  }

  Widget titleRow(
    String title,
  ) {
    return Padding(
      padding: EdgeInsets.only(
        left: 29.w,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: 'custom',
              fontWeight: FontWeight.w600,
              color: const Color(0xff343434),
            ),
          ),
        ],
      ),
    );
  }

  Widget titleRow2(
    String title,
  ) {
    return Padding(
      padding: EdgeInsets.only(
        left: 29.w,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: 'custom',
              fontWeight: FontWeight.w700,
              color: const Color(0xff000000),
            ),
          ),
        ],
      ),
    );
  }

  Widget options() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 29.w,
      ),
      child: Consumer<DoctorProvider>(
        builder: (context, value, child) {
          return SizedBox(
            width: double.infinity,
            height: 56.h,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 20,
              ),
              itemCount: value.doctorDetails.doctorSectors!.length,
              itemBuilder: (BuildContext context, int index) {
                String text = value
                    .doctorDetails.doctorSectors![index].sectorName
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
          );
        },
      ),
    );
  }
}
