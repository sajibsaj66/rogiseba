// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Providers/BloodProvider.dart';
import 'package:url_launcher/url_launcher_string.dart';

class BloodDonorList extends StatelessWidget {
  final int bloodGroupID;
  final int bloodID;
  const BloodDonorList(
      {super.key, required this.bloodGroupID, required this.bloodID});

  @override
  Widget build(BuildContext context) {
    return Consumer<BloodProvider>(
      builder: (context, value, child) {
        return Expanded(
          child: ListView.builder(
            itemCount: value.allDonator.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return bloodGroupID ==
                          value.allDonator.data![index].bloodDonationGroupId &&
                      bloodID == value.allDonator.data![index].bloodGroupId
                  ? Padding(
                      padding: EdgeInsets.only(
                        left: 30.w,
                        right: 30.w,
                        bottom: 21.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              imageBox(""),
                              SizedBox(width: 15.w),
                              details(
                                value.allDonator.data![index].donatorName
                                    .toString(),
                                value
                                    .allDonator.data![index].donatorMobileNumber
                                    .toString(),
                                "${value.allDonator.data![index].districtName}, ${value.allDonator.data![index].divisionName}",
                              ),
                            ],
                          ),
                          options(value
                              .allDonator.data![index].donatorMobileNumber
                              .toString())
                        ],
                      ),
                    )
                  : Container();
            },
          ),
        );
      },
    );
  }

  Widget imageBox(String imageUrl) {
    return Container(
      height: 54.h,
      width: 54.w,
      decoration: const BoxDecoration(
        color: Color(0xffD9D9D9),
      ),
    );
  }

  Widget details(String doctorName, String category, String location) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          doctorName,
          style: TextStyle(
            fontSize: 14.sp,
            fontFamily: 'custom',
            fontWeight: FontWeight.w400,
            color: const Color(0xff000000),
          ),
        ),
        Text(
          category,
          style: TextStyle(
            fontSize: 12.sp,
            fontFamily: 'custom',
            fontWeight: FontWeight.w400,
            color: const Color(0xffF0787E),
          ),
        ),
        Text(
          location,
          style: TextStyle(
            fontSize: 12.sp,
            fontFamily: 'custom',
            fontWeight: FontWeight.w400,
            color: const Color(0xffCACACA),
          ),
        ),
      ],
    );
  }

  Widget options(String number) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            launchUrlString('tel:$number');
          },
          child: Image.asset(
            "assets/images/contact.png",
            height: 20.h,
            width: 20.w,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(width: 21.w),
      ],
    );
  }
}
