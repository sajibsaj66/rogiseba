// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Providers/DoctorProvider.dart';

class DoctorDetailsTop extends StatelessWidget {
  const DoctorDetailsTop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DoctorProvider>(
      builder: (context, value, child) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 180.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10.r),
                  bottomLeft: Radius.circular(10.r),
                ),
                color: const Color(0xffFFDBDD),
              ),
            ),
            Positioned(
              top: 10.h,
              child: backButton(context),
            ),
            Positioned(
              top: 57.h,
              child: imageRow(
                value.doctorDetails.doctorInfo![0].doctorPicUrl.toString(),
                value.doctorDetails.doctorInfo![0].doctorName.toString(),
                value.doctorDetails.doctorInfo![0].name.toString(),
                value.doctorDetails.doctorInfo![0].doctorDegree.toString(),
                "${value.doctorDetails.doctorInfo![0].districtName.toString()}, ${value.doctorDetails.doctorInfo![0].divisionName.toString()}",
              ),
            ),
            Positioned(
              top: 163.h,
              child: infoRow(
                "রোগী ${value.doctorDetails.doctorInfo![0].doctorTotalPatientCount}+",
                "${value.doctorDetails.doctorInfo![0].doctorExperience} বছর+",
                "${value.doctorDetails.doctorRating} রেটিং",
              ),
            )
          ],
        );
      },
    );
  }

  Widget backButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: const Color(0xffFFFFFF),
          size: 25.sp,
        ),
      ),
    );
  }

  Widget imageRow(
    String imageUrl,
    String name,
    String category,
    String degree,
    String location,
  ) {
    return Padding(
      padding: EdgeInsets.only(
        left: 49.w,
      ),
      child: Row(
        children: [
          Container(
            height: 64.h,
            width: 64.w,
            decoration: BoxDecoration(
              color: const Color(0xffFFFFFF),
              image: DecorationImage(
                image: NetworkImage(
                  imageUrl,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'custom',
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff343434),
                ),
              ),
              Text(
                category,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'custom',
                  fontWeight: FontWeight.w400,
                  color: const Color(0xffF0787E),
                ),
              ),
              Text(
                degree,
                style: TextStyle(
                  fontSize: 11.sp,
                  fontFamily: 'custom',
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff343434),
                ),
              ),
              Text(
                location,
                style: TextStyle(
                  fontSize: 10.sp,
                  fontFamily: 'custom',
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff343434),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget infoRow(String info1, String info2, String info3) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          infoBox(info1),
          SizedBox(
            width: 8.w,
          ),
          infoBox(info2),
          SizedBox(
            width: 8.w,
          ),
          infoBox(info3),
        ],
      ),
    );
  }

  Widget infoBox(String info) {
    return Container(
      height: 30.h,
      width: 98.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff000000).withOpacity(0.25),
            offset: const Offset(0, 0),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Text(
        info,
        style: TextStyle(
          fontSize: 13.sp,
          fontFamily: 'custom',
          fontWeight: FontWeight.w400,
          color: const Color(0xff000000),
        ),
      ),
    );
  }
}
