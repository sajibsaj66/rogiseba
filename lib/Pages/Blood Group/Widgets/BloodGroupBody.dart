// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Pages/Blood%20Donor/BloodDonor.dart';
import 'package:rogisheba/Providers/BloodProvider.dart';

class BloodGroupBody extends StatelessWidget {
  final int bloodGroupID;
  const BloodGroupBody({super.key, required this.bloodGroupID});

  @override
  Widget build(BuildContext context) {
    return Consumer<BloodProvider>(
      builder: (context, value, child) {
        return Column(
          children: List.generate(
            value.allBloodGroup.data!.length,
            (index) => GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return BloodDonor(
                        title: value.allBloodGroup.data![index].bloodGroupName
                            .toString(),
                        bloodGroupID: bloodGroupID,
                        bloodID: value.allBloodGroup.data![index].id!.toInt(),
                      );
                    },
                  ),
                );
              },
              child: Container(
                height: 55.h,
                width: double.infinity,
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                  bottom: 7.h,
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: const Color(0xffD9D9D9),
                    width: 1.w,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      value.allBloodGroup.data![index].bloodGroupName
                          .toString(),
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: 'custom',
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff343434),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 18.sp,
                      color: const Color(0xffD9D9D9),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
